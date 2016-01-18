using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Collider))]
public class PickupObject : MonoBehaviour {

    private new Collider collider;
    public PickupType type = PickupType.None;
    public float value = 0;
    public string playerTag = "Player";

	// Use this for initialization
	void Start () {
        collider = GetComponent<Collider>();
        collider.isTrigger = true;
	}

    void OnTriggerEnter(Collider col)
    {
        if(col.tag == playerTag)
        {
            PickupProperties pickupProperties = new PickupProperties(type, value);
            col.SendMessageUpwards("OnPickUp", pickupProperties);
            Destroy(gameObject);
        }
    }

    void OnDrawGizmosSelected()
    {
        if (!collider)
            collider = GetComponent<Collider>();
        Color c;
        switch (type)
        {
            case PickupType.Score:
                c = Color.green;
                break;
            case PickupType.Heal:
                c = Color.cyan;
                break;
            default:
                c = Color.magenta;
                break;
        }
        c.a = 0.6f;
        Gizmos.color = c;
        Gizmos.DrawCube(collider.bounds.center, collider.bounds.size);
    }
}

public struct PickupProperties
{
    public PickupType type;
    public float value;

    public PickupProperties(PickupType type, float value)
    {
        this.type = type;
        this.value = value;
    }

    public override string ToString() {
        return string.Format("PickupProperties: Type = {0}, Value = {1}", type, value);
    }
}

public enum PickupType
{
    None,
    Score,
    Heal
}
