using UnityEngine;
using System.Collections;

[RequireComponent(typeof(BoxCollider))]
[RequireComponent(typeof(Rigidbody))]
public class ObjectDestroyer : MonoBehaviour {

	void OnTriggerEnter(Collider col)
    {
        Debug.Log("Collided with destroyer : " + col.ToString());
        GameObject obj = col.gameObject;
        while (obj.transform.parent != null) obj = obj.transform.parent.gameObject;
        Destroy(obj);
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawCube(transform.position, transform.lossyScale);
    }
}
