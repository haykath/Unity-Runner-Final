using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class UIController : MonoBehaviour {

    private static UIController instance;

    public Text scoreText;
    public Text pickupsText;
    public Text healthText;
    public Text messageText;

    public PlayerManager pManager;
    public DamageableObject pDamage;

    private Coroutine messageCoroutine = null;

	// Use this for initialization
	void Awake () {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            Destroy(this);
        }
    }

    void Start()
    {
        messageText.text = "";
    }

    void OnDestroy()
    {
        instance = null;
    }

    // Update is called once per frame
    void Update () {
        scoreText.text = string.Format("Score: {0:F0}", ScoreManager.DisplayedScore);
        pickupsText.text = string.Format("Passengers: {0}", pManager.ScorePickUps);
        healthText.text = string.Format("Health: {0}", pDamage.Health);
	}

    public static void DisplayMessage(string message, float time)
    {
        if (!instance)
        {
            Debug.LogError("No instance of UIController was found.");
            return;
        }

        if (instance.messageCoroutine != null)
            instance.StopCoroutine(instance.messageCoroutine);
        instance.messageCoroutine = instance.StartCoroutine(instance.DisplayText(message, time));
    }

    IEnumerator DisplayText(string message, float time)
    {
        messageText.text = message;
        yield return new WaitForSeconds(time);
        messageText.text = "";
        messageCoroutine = null;
    }
}
