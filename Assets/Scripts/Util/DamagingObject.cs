using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Collider))]
public class DamagingObject : MonoBehaviour {

    public float power = 1f;
    public bool destroyOnHit = true;

    public GameObject objToDestroy = null;

    void Awake()
    {
        if (objToDestroy == null) objToDestroy = gameObject;
    }

    void OnTriggerEnter(Collider col)
    {
        DamageableObject obj = col.GetComponentInParent<DamageableObject>();

        if (obj)
            obj.Health -= power;

        if (destroyOnHit){
            Destroy(objToDestroy);
            SendMessageUpwards("OnDeath",SendMessageOptions.DontRequireReceiver);
        };
    }

    void OnColisionEnter(Collision col)
    {
        DamageableObject obj = col.collider.GetComponentInParent<DamageableObject>();

        if (obj)
            obj.Health -= power;

        if (destroyOnHit){
            Destroy(objToDestroy);
            SendMessageUpwards("OnDeath", SendMessageOptions.DontRequireReceiver);
        };
    }

    void OnDestroy()
    {
        Destroy(objToDestroy);
    }
}
