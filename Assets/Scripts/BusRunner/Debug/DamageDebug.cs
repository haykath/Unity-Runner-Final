using UnityEngine;
using System.Collections;

public class DamageDebug : MonoBehaviour {

	void OnDeath()
    {
        Destroy(gameObject);
    }
}
