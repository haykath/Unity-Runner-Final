using UnityEngine;
using System.Collections;

public class BusStop : MonoBehaviour {

	// Use this for initialization
	void OnDrawGizmosSelected()
    {
        Color c = Color.blue;
        c.a = 0.6f;
        Gizmos.color = c;
        Gizmos.DrawCube(transform.position, transform.lossyScale);
    }

    void OnTriggerEnter(Collider col)
    {
        if(col.tag == "Player")
        {
            col.gameObject.SendMessageUpwards("ApplyBonusPickup");
        }
    }

}
