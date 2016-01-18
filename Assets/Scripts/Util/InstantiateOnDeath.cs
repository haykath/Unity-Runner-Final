using UnityEngine;
using System.Collections;
#if UNITY_EDITOR
using UnityEditor;
#endif

public class InstantiateOnDeath : MonoBehaviour {

    public GameObject prefab;

	void OnDeath()
    {
        if (!prefab)
            return;

        Instantiate(prefab, transform.position, transform.rotation);
    }
}
