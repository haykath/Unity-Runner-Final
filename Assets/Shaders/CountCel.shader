// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Custom/CountCel" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
		[Normal] [NoScaleOffset] _NormalMap ("Normal Map", 2D) = "bump" {}
        _Color ("Color", Color) = (1,1,1,1)
        _OutlineWidth ("Outline Width", Range(0, 10)) = 1
        _Gloss ("Gloss", Range(0, 1)) = 1
        _GlossIntensity ("Gloss Intensity", Range(0, 1)) = 1
        _RimLightColor ("Rim Light Color", Color) = (0.5,0.5,0.5,1)
        _RimLightIntensity ("Rim Light Intensity", Range(0, 1)) = 0.7
        _FresnelExp ("Fresnel Exp", Float ) = 3
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _IntensityCount ("Intensity Count", Range(2, 10)) = 4
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }

		//Outline pass
        Pass {
            Name "Outline"
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma multi_compile_shadowcaster

            uniform float _OutlineWidth;
            uniform float4 _OutlineColor;

            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct VertexOutput {
                float4 pos : SV_POSITION;
            };

            VertexOutput vert (VertexInput v) {
                VertexOutput o;
				//Scale along normals
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*(_OutlineWidth/100.0),1));
                return o;
            }

            float4 frag(VertexOutput i) : COLOR {
				if(_OutlineWidth == 0.0)
					discard;

                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
        }


        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            //Base pass
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows

            uniform float4 _Color;
            uniform float _FresnelExp;
            uniform float _Gloss;
            uniform float4 _RimLightColor;
            uniform float _RimLightIntensity;
            uniform float _GlossIntensity;
            uniform float _IntensityCount;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };

            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };

			float DiscreteRemap( float Value , float ValueCt ){
				ValueCt = trunc(ValueCt);
				float step = 1 / (max(2, ValueCt) - 1);
				float val = trunc(ValueCt*saturate(Value));
				return (step*val);
            }

            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }

            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);

                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _MainTex)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;

                float attenuation = LIGHT_ATTENUATION(i);

                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));

				float fresnel = pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelExp);
				float3 rimLight = _RimLightColor.rgb*DiscreteRemap( fresnel*_RimLightIntensity, _IntensityCount );

				float diffuse = dot(normalDirection,lightDirection);
				float3 diffuseColor = _Color.rgb*_MainTex_var.rgb*DiscreteRemap( diffuse*attenuation , _IntensityCount );

				float specular = pow(dot(lightDirection,viewReflectDirection),_Gloss*10.0+1.0);
				float toonSpecular = DiscreteRemap( specular*_GlossIntensity*attenuation, _IntensityCount );

                float3 ambient = UNITY_LIGHTMODEL_AMBIENT.rgb*_Color.rgb*_MainTex_var.rgb;

                float3 finalColor = ambient + rimLight + (diffuseColor+toonSpecular)*_LightColor0.rgb;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows

            uniform float4 _Color;
            uniform float _FresnelExp;
            uniform float _Gloss;
            uniform float4 _RimLightColor;
            uniform float _RimLightIntensity;
            uniform float _GlossIntensity;
            uniform float _IntensityCount;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
			uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;         

            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };

            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };

			float DiscreteRemap( float Value , float ValueCt ){
				ValueCt = trunc(ValueCt);
				float step = 1 / (max(2, ValueCt) - 1);
				float val = trunc(ValueCt*saturate(Value));
				return (step*val);
            } 

            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);

                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _MainTex)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;

                float attenuation = LIGHT_ATTENUATION(i);

                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));

				float fresnel = pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelExp);
				float3 rimLight = _RimLightColor.rgb*DiscreteRemap( fresnel*_RimLightIntensity, _IntensityCount );

				float diffuse = dot(i.normalDir,lightDirection);
				float3 diffuseColor = _Color.rgb*_MainTex_var.rgb*DiscreteRemap( diffuse*attenuation , _IntensityCount );

				float specular = pow(dot(lightDirection,viewReflectDirection),(_Gloss*10.0+1.0))*attenuation*_GlossIntensity;
				float toonSpecular = DiscreteRemap( specular, _IntensityCount );

                float3 finalColor = rimLight + (diffuseColor+toonSpecular)*_LightColor0.rgb;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
