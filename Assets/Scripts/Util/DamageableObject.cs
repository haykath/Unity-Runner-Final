using UnityEngine;
using System.Collections;

public class DamageableObject : MonoBehaviour {

    public bool dead = false;

    [SerializeField]
    private float health = 3f;
    public float Health
    {
        get { return health; }
        set {
            ChangeHealth(value);
        }
    }

    public float MaxHealth = 5f;

	void ChangeHealth(float value)
    {
        float deltaHealth = value - health;

        if (health + deltaHealth > MaxHealth)
            return;

        health = value;

        SendMessageUpwards("OnHealthChanged", deltaHealth);
        if (health <= 0 && !dead)
        {
            SendMessage("OnDeath", SendMessageOptions.DontRequireReceiver);
            dead = true;
        }
    }
}
