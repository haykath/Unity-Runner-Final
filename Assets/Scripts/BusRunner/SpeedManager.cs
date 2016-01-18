using UnityEngine;
using System.Collections;

public class SpeedManager : MonoBehaviour
{
    private static SpeedManager instance = null;

    [SerializeField]
    private float speedUp = 1f;
    [SerializeField]
    private float speedUpAmount = 0.2f;

    #region Accessors
    //Static acessors return the default value if there is no instance.
    public static float SpeedUpMultiplier {
        get { return instance ? instance.speedUp : 1f; }

        internal set {
            if (instance) instance.speedUp = value;
            else Debug.LogError("No instance of GameManager present in the scene.");
        }
    }
    public static float SpeedUpAmount {
        get { return instance ? instance.speedUpAmount : 0.2f; }

        internal set {
            if (instance) instance.speedUpAmount = value;
            else Debug.LogError("No instance of GameManager present in the scene.");
        }
    }
    #endregion

    void Awake()
    {
        //Singleton-like implementation
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            DestroyImmediate(gameObject);
        }

        //Initialization stuff goes here
    }

    public static void SpeedUp()
    {
        SpeedUpMultiplier += SpeedUpAmount;
    }

    public static void SpeedUp(float amount)
    {
        SpeedUpMultiplier += amount;
    }

    void OnDestroy()
    {
        instance = null;
    }
}
