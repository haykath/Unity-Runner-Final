using UnityEngine;
using System.Collections;

public class ObjectSpawner : MonoBehaviour {

    public GameObject[] objects;

    public float minSpawnTime = 1f;
    public float maxSpawnTime = 6f;
    public bool readjustPosition = true;

	// Use this for initialization
	void Start () {
        if(objects.Length > 0)
        {
            StartCoroutine(SpawnCoroutine());
        }	
	}

    public void SpawnRandom()
    {
        if (objects.Length > 0 && SpeedManager.SpeedUpMultiplier > 0f)
        {
            GameObject go = Instantiate(objects[Random.Range(0, objects.Length)], transform.position, transform.rotation) as GameObject;
            Renderer r = go.GetComponent<Renderer>();
            if (r && readjustPosition)
            {
                go.transform.position += r.bounds.extents.y * Vector3.up;
            }
        }
    }

    IEnumerator SpawnCoroutine()
    {
        while(SpeedManager.SpeedUpMultiplier > 0)
        {
            float su = 1f / SpeedManager.SpeedUpMultiplier;
            float time = Random.Range(minSpawnTime * su, maxSpawnTime * su);
            yield return new WaitForSeconds(time);
            SpawnRandom();
        }
    }

    void OnDrawGizmos()
    {
        Gizmos.color = Color.green;
        Gizmos.DrawSphere(transform.position, 0.3f);
    }
	
}
