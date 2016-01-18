using UnityEngine;
using System.Collections;

public class MovingObject : MonoBehaviour {

    public float speed;
    public Vector3 direction;

    public bool useFixedTime;
	
	// Update is called once per frame
	void Update ()
    {
        if (useFixedTime)
            return;

        transform.position += speed * direction * SpeedManager.SpeedUpMultiplier * Time.deltaTime;
    }

    void FixedUpdate()
    {
        if (!useFixedTime)
            return;

        transform.position += speed * direction * SpeedManager.SpeedUpMultiplier *Time.fixedDeltaTime;
    }

}
