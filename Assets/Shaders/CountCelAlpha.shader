// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.26 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.26;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:34784,y:32075,varname:node_3138,prsc:2|normal-6901-RGB,emission-2549-OUT,custl-2011-OUT,clip-4351-OUT;n:type:ShaderForge.SFN_Color,id:7241,x:30403,y:32230,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_NormalVector,id:6132,x:30470,y:32766,prsc:2,pt:True;n:type:ShaderForge.SFN_LightVector,id:8062,x:30466,y:32980,varname:node_8062,prsc:2;n:type:ShaderForge.SFN_ViewReflectionVector,id:6569,x:30466,y:33185,varname:node_6569,prsc:2;n:type:ShaderForge.SFN_Dot,id:4836,x:30688,y:32854,varname:node_4836,prsc:2,dt:0|A-6132-OUT,B-8062-OUT;n:type:ShaderForge.SFN_LightAttenuation,id:1142,x:30661,y:31855,varname:node_1142,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1658,x:31882,y:31548,varname:node_1658,prsc:2|A-253-OUT,B-3847-OUT;n:type:ShaderForge.SFN_Multiply,id:7450,x:32676,y:31480,varname:node_7450,prsc:2|A-5917-OUT,B-1980-OUT;n:type:ShaderForge.SFN_Dot,id:6915,x:30688,y:33086,varname:node_6915,prsc:2,dt:0|A-8062-OUT,B-6569-OUT;n:type:ShaderForge.SFN_Power,id:9885,x:31858,y:31984,varname:node_9885,prsc:2|VAL-2202-OUT,EXP-5071-OUT;n:type:ShaderForge.SFN_LightColor,id:4032,x:33323,y:32446,varname:node_4032,prsc:2;n:type:ShaderForge.SFN_AmbientLight,id:8885,x:32497,y:33158,varname:node_8885,prsc:2;n:type:ShaderForge.SFN_Multiply,id:9741,x:32709,y:33297,varname:node_9741,prsc:2|A-8885-RGB,B-9351-OUT;n:type:ShaderForge.SFN_Slider,id:6075,x:30032,y:31598,ptovrint:False,ptlb:Outline Width,ptin:_OutlineWidth,varname:node_6075,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:10;n:type:ShaderForge.SFN_Divide,id:217,x:30425,y:31595,varname:node_217,prsc:2|A-6075-OUT,B-8681-OUT;n:type:ShaderForge.SFN_Vector1,id:8681,x:30174,y:31689,varname:node_8681,prsc:2,v1:100;n:type:ShaderForge.SFN_Multiply,id:2007,x:32074,y:32070,varname:node_2007,prsc:2|A-9885-OUT,B-4221-OUT,C-962-OUT;n:type:ShaderForge.SFN_Add,id:3932,x:33323,y:32300,varname:node_3932,prsc:2|A-2986-OUT,B-2286-OUT;n:type:ShaderForge.SFN_Multiply,id:6343,x:33508,y:32331,varname:node_6343,prsc:2|A-3932-OUT,B-4032-RGB;n:type:ShaderForge.SFN_Fresnel,id:9454,x:31617,y:32685,varname:node_9454,prsc:2|EXP-131-OUT;n:type:ShaderForge.SFN_ValueProperty,id:131,x:31436,y:32707,ptovrint:False,ptlb:Fresnel Exp,ptin:_FresnelExp,varname:node_131,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_Slider,id:4210,x:31205,y:32111,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_4210,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_RemapRange,id:5071,x:31588,y:32075,varname:node_5071,prsc:2,frmn:0,frmx:1,tomn:1,tomx:11|IN-4210-OUT;n:type:ShaderForge.SFN_Color,id:9378,x:32454,y:32534,ptovrint:False,ptlb:Rim Light Color,ptin:_RimLightColor,varname:node_9378,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:5418,x:31814,y:32742,varname:node_5418,prsc:2|A-9454-OUT,B-2463-OUT;n:type:ShaderForge.SFN_Slider,id:2463,x:31354,y:32891,ptovrint:False,ptlb:Rim Light Intensity,ptin:_RimLightIntensity,varname:node_2463,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.7,max:1;n:type:ShaderForge.SFN_Multiply,id:3926,x:32665,y:32717,varname:node_3926,prsc:2|A-9378-RGB,B-878-OUT;n:type:ShaderForge.SFN_Add,id:8934,x:33695,y:32304,varname:node_8934,prsc:2|A-3575-OUT,B-6343-OUT;n:type:ShaderForge.SFN_Slider,id:962,x:31696,y:32286,ptovrint:False,ptlb:Gloss Intensity,ptin:_GlossIntensity,varname:node_962,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Slider,id:7052,x:30513,y:32514,ptovrint:False,ptlb:Intensity Count,ptin:_IntensityCount,varname:node_7052,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:2,cur:4,max:10;n:type:ShaderForge.SFN_Color,id:8118,x:30425,y:31446,ptovrint:False,ptlb:Outline Color,ptin:_OutlineColor,varname:node_8118,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Tex2d,id:5733,x:30403,y:32041,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5733,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Code,id:1980,x:32091,y:31546,varname:node_1980,prsc:2,code:VgBhAGwAdQBlAEMAdAAgAD0AIAB0AHIAdQBuAGMAKABWAGEAbAB1AGUAQwB0ACkAOwAKAGYAbABvAGEAdAAgAHMAdABlAHAAIAA9ACAAMQAgAC8AIAAoAG0AYQB4ACgAMgAsACAAVgBhAGwAdQBlAEMAdAApACAALQAgADEAKQA7AAoAZgBsAG8AYQB0ACAAdgBhAGwAIAA9ACAAdAByAHUAbgBjACgAVgBhAGwAdQBlAEMAdAAqAHMAYQB0AHUAcgBhAHQAZQAoAFYAYQBsAHUAZQApACkAOwAKAHIAZQB0AHUAcgBuACAAKABzAHQAZQBwACoAdgBhAGwAKQA7AA==,output:0,fname:DiscreteRemap2,width:511,height:132,input:0,input:0,input_1_label:Value,input_2_label:ValueCt|A-1658-OUT,B-8773-OUT;n:type:ShaderForge.SFN_Code,id:878,x:32065,y:32738,varname:node_878,prsc:2,code:VgBhAGwAdQBlAEMAdAAgAD0AIAB0AHIAdQBuAGMAKABWAGEAbAB1AGUAQwB0ACkAOwAKAGYAbABvAGEAdAAgAHMAdABlAHAAIAA9ACAAMQAgAC8AIAAoAG0AYQB4ACgAMgAsACAAVgBhAGwAdQBlAEMAdAApACAALQAgADEAKQA7AAoAZgBsAG8AYQB0ACAAdgBhAGwAIAA9ACAAdAByAHUAbgBjACgAVgBhAGwAdQBlAEMAdAAqAHMAYQB0AHUAcgBhAHQAZQAoAFYAYQBsAHUAZQApACkAOwAKAHIAZQB0AHUAcgBuACAAKABzAHQAZQBwACoAdgBhAGwAKQA7AA==,output:0,fname:DiscreteRemap,width:511,height:132,input:0,input:0,input_1_label:Value,input_2_label:ValueCt|A-5418-OUT,B-815-OUT;n:type:ShaderForge.SFN_Code,id:1875,x:32295,y:32111,varname:node_1875,prsc:2,code:VgBhAGwAdQBlAEMAdAAgAD0AIAB0AHIAdQBuAGMAKABWAGEAbAB1AGUAQwB0ACkAOwAKAGYAbABvAGEAdAAgAHMAdABlAHAAIAA9ACAAMQAgAC8AIAAoAG0AYQB4ACgAMgAsACAAVgBhAGwAdQBlAEMAdAApACAALQAgADEAKQA7AAoAZgBsAG8AYQB0ACAAdgBhAGwAIAA9ACAAdAByAHUAbgBjACgAVgBhAGwAdQBlAEMAdAAqAHMAYQB0AHUAcgBhAHQAZQAoAFYAYQBsAHUAZQApACkAOwAKAHIAZQB0AHUAcgBuACAAKABzAHQAZQBwACoAdgBhAGwAKQA7AA==,output:0,fname:DiscreteRemap3,width:511,height:132,input:0,input:0,input_1_label:Value,input_2_label:ValueCt|A-2007-OUT,B-7021-OUT;n:type:ShaderForge.SFN_Tex2d,id:6901,x:34561,y:31930,ptovrint:False,ptlb:Normal Map,ptin:_NormalMap,varname:node_6901,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Multiply,id:4860,x:30655,y:32131,varname:node_4860,prsc:2|A-5733-RGB,B-7241-RGB;n:type:ShaderForge.SFN_Set,id:6815,x:30848,y:32510,varname:IntensityCount,prsc:2|IN-7052-OUT;n:type:ShaderForge.SFN_Get,id:8773,x:31861,y:31691,varname:node_8773,prsc:2|IN-6815-OUT;n:type:ShaderForge.SFN_Get,id:815,x:31793,y:32914,varname:node_815,prsc:2|IN-6815-OUT;n:type:ShaderForge.SFN_Get,id:7021,x:32074,y:32265,varname:node_7021,prsc:2|IN-6815-OUT;n:type:ShaderForge.SFN_Set,id:2795,x:30835,y:31855,varname:Attenuation,prsc:2|IN-1142-OUT;n:type:ShaderForge.SFN_Get,id:3847,x:31653,y:31584,varname:node_3847,prsc:2|IN-2795-OUT;n:type:ShaderForge.SFN_Get,id:4221,x:31858,y:32148,varname:node_4221,prsc:2|IN-2795-OUT;n:type:ShaderForge.SFN_Set,id:2051,x:30836,y:32854,varname:NdotL,prsc:2|IN-4836-OUT;n:type:ShaderForge.SFN_Get,id:253,x:31653,y:31519,varname:node_253,prsc:2|IN-2051-OUT;n:type:ShaderForge.SFN_Get,id:2202,x:31639,y:31984,varname:node_2202,prsc:2|IN-9716-OUT;n:type:ShaderForge.SFN_Set,id:9716,x:30836,y:33086,varname:LdotV,prsc:2|IN-6915-OUT;n:type:ShaderForge.SFN_Set,id:7045,x:30852,y:32131,varname:DiffuseColor,prsc:2|IN-4860-OUT;n:type:ShaderForge.SFN_Get,id:9351,x:32497,y:33316,varname:node_9351,prsc:2|IN-7045-OUT;n:type:ShaderForge.SFN_Get,id:5917,x:32482,y:31441,varname:node_5917,prsc:2|IN-7045-OUT;n:type:ShaderForge.SFN_Set,id:1224,x:32863,y:32717,varname:RimLight,prsc:2|IN-3926-OUT;n:type:ShaderForge.SFN_Get,id:3575,x:33487,y:32267,varname:node_3575,prsc:2|IN-1224-OUT;n:type:ShaderForge.SFN_Set,id:4784,x:32856,y:31480,varname:Diffuse,prsc:2|IN-7450-OUT;n:type:ShaderForge.SFN_Get,id:2986,x:33141,y:32290,varname:node_2986,prsc:2|IN-4784-OUT;n:type:ShaderForge.SFN_Set,id:7036,x:32867,y:32107,varname:Specular,prsc:2|IN-1875-OUT;n:type:ShaderForge.SFN_Get,id:2286,x:33141,y:32371,varname:node_2286,prsc:2|IN-7036-OUT;n:type:ShaderForge.SFN_Get,id:2549,x:34563,y:32175,varname:node_2549,prsc:2|IN-9439-OUT;n:type:ShaderForge.SFN_Set,id:9439,x:32869,y:33297,varname:Ambient,prsc:2|IN-9741-OUT;n:type:ShaderForge.SFN_Append,id:9230,x:30651,y:31531,varname:node_9230,prsc:2|A-8118-RGB,B-217-OUT;n:type:ShaderForge.SFN_Set,id:319,x:30823,y:31531,varname:Outline,prsc:2|IN-9230-OUT;n:type:ShaderForge.SFN_Set,id:1081,x:33855,y:32304,varname:FinalColor,prsc:2|IN-8934-OUT;n:type:ShaderForge.SFN_Get,id:2011,x:34563,y:32291,varname:node_2011,prsc:2|IN-1081-OUT;n:type:ShaderForge.SFN_Set,id:1713,x:30852,y:32326,varname:Opacity,prsc:2|IN-1176-OUT;n:type:ShaderForge.SFN_Multiply,id:1176,x:30655,y:32326,varname:node_1176,prsc:2|A-5733-A,B-7241-A,C-7236-OUT;n:type:ShaderForge.SFN_Get,id:4351,x:34563,y:32355,varname:node_4351,prsc:2|IN-1713-OUT;n:type:ShaderForge.SFN_Slider,id:7236,x:30273,y:32412,ptovrint:False,ptlb:Cutout,ptin:_Cutout,varname:node_7236,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5,max:1;proporder:5733-6901-7241-6075-4210-962-9378-2463-131-8118-7052-7236;pass:END;sub:END;*/

Shader "Shader Forge/CountCelAlpha" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _Color ("Color", Color) = (1,1,1,1)
        _OutlineWidth ("Outline Width", Range(0, 10)) = 1
        _Gloss ("Gloss", Range(0, 1)) = 1
        _GlossIntensity ("Gloss Intensity", Range(0, 1)) = 1
        _RimLightColor ("Rim Light Color", Color) = (0.5,0.5,0.5,1)
        _RimLightIntensity ("Rim Light Intensity", Range(0, 1)) = 0.7
        _FresnelExp ("Fresnel Exp", Float ) = 3
        _OutlineColor ("Outline Color", Color) = (0,0,0,1)
        _IntensityCount ("Intensity Count", Range(2, 10)) = 4
        _Cutout ("Cutout", Range(0, 1)) = 0.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _FresnelExp;
            uniform float _Gloss;
            uniform float4 _RimLightColor;
            uniform float _RimLightIntensity;
            uniform float _GlossIntensity;
            uniform float _IntensityCount;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            float DiscreteRemap2( float Value , float ValueCt ){
            ValueCt = trunc(ValueCt);
            float step = 1 / (max(2, ValueCt) - 1);
            float val = trunc(ValueCt*saturate(Value));
            return (step*val);
            }
            
            float DiscreteRemap( float Value , float ValueCt ){
            ValueCt = trunc(ValueCt);
            float step = 1 / (max(2, ValueCt) - 1);
            float val = trunc(ValueCt*saturate(Value));
            return (step*val);
            }
            
            float DiscreteRemap3( float Value , float ValueCt ){
            ValueCt = trunc(ValueCt);
            float step = 1 / (max(2, ValueCt) - 1);
            float val = trunc(ValueCt*saturate(Value));
            return (step*val);
            }
            
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Cutout;
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
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float Opacity = (_MainTex_var.a*_Color.a*_Cutout);
                clip(Opacity - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float3 DiffuseColor = (_MainTex_var.rgb*_Color.rgb);
                float3 Ambient = (UNITY_LIGHTMODEL_AMBIENT.rgb*DiffuseColor);
                float3 emissive = Ambient;
                float IntensityCount = _IntensityCount;
                float3 RimLight = (_RimLightColor.rgb*DiscreteRemap( (pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelExp)*_RimLightIntensity) , IntensityCount ));
                float NdotL = dot(normalDirection,lightDirection);
                float Attenuation = attenuation;
                float3 Diffuse = (DiffuseColor*DiscreteRemap2( (NdotL*Attenuation) , IntensityCount ));
                float LdotV = dot(lightDirection,viewReflectDirection);
                float Specular = DiscreteRemap3( (pow(LdotV,(_Gloss*10.0+1.0))*Attenuation*_GlossIntensity) , IntensityCount );
                float3 FinalColor = (RimLight+((Diffuse+Specular)*_LightColor0.rgb));
                float3 finalColor = emissive + FinalColor;
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
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float _FresnelExp;
            uniform float _Gloss;
            uniform float4 _RimLightColor;
            uniform float _RimLightIntensity;
            uniform float _GlossIntensity;
            uniform float _IntensityCount;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            float DiscreteRemap2( float Value , float ValueCt ){
            ValueCt = trunc(ValueCt);
            float step = 1 / (max(2, ValueCt) - 1);
            float val = trunc(ValueCt*saturate(Value));
            return (step*val);
            }
            
            float DiscreteRemap( float Value , float ValueCt ){
            ValueCt = trunc(ValueCt);
            float step = 1 / (max(2, ValueCt) - 1);
            float val = trunc(ValueCt*saturate(Value));
            return (step*val);
            }
            
            float DiscreteRemap3( float Value , float ValueCt ){
            ValueCt = trunc(ValueCt);
            float step = 1 / (max(2, ValueCt) - 1);
            float val = trunc(ValueCt*saturate(Value));
            return (step*val);
            }
            
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform float _Cutout;
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
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
                float3 normalLocal = _NormalMap_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float Opacity = (_MainTex_var.a*_Color.a*_Cutout);
                clip(Opacity - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float IntensityCount = _IntensityCount;
                float3 RimLight = (_RimLightColor.rgb*DiscreteRemap( (pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelExp)*_RimLightIntensity) , IntensityCount ));
                float3 DiffuseColor = (_MainTex_var.rgb*_Color.rgb);
                float NdotL = dot(normalDirection,lightDirection);
                float Attenuation = attenuation;
                float3 Diffuse = (DiffuseColor*DiscreteRemap2( (NdotL*Attenuation) , IntensityCount ));
                float LdotV = dot(lightDirection,viewReflectDirection);
                float Specular = DiscreteRemap3( (pow(LdotV,(_Gloss*10.0+1.0))*Attenuation*_GlossIntensity) , IntensityCount );
                float3 FinalColor = (RimLight+((Diffuse+Specular)*_LightColor0.rgb));
                float3 finalColor = FinalColor;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _Cutout;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float Opacity = (_MainTex_var.a*_Color.a*_Cutout);
                clip(Opacity - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
