using UnityEngine;
using System.Collections;

public class TextureOffset : MonoBehaviour {

    const float speedDecreaseFactor = 0.1f; //Used to allow for more legible numbers while setting up the speed in the inspector

    public Vector2 speed = Vector2.zero;
    public string[] texturePropertyNames = { "_MainTex" };

    private Vector2 textureOffset = Vector2.zero;
    private Material material;

	// Use this for initialization
	void Awake () {
        Renderer r = GetComponent<Renderer>();
        if (r)
        {
            material = r ? r.material : null;
        }
        else
        {
            Debug.LogError("No renderer was found. " + ToString());
        }
	}
	
	// Update is called once per frame
	void FixedUpdate () {
        if (material)
        {
            textureOffset += speed * speedDecreaseFactor * SpeedManager.SpeedUpMultiplier * Time.fixedDeltaTime;
            textureOffset.x %= 1; textureOffset.y %= 1;
            foreach (var s in texturePropertyNames)
            {
                if (material.HasProperty(s))
                    material.SetTextureOffset(s, textureOffset);
                else
                    Debug.LogWarning(string.Format(@"No property with name ""{0}"" was found in material: {1}. {2}", s, material, this));
            }
        }
        else
        {
            Debug.LogError("No material is set. " + ToString());
        }
	}
}
