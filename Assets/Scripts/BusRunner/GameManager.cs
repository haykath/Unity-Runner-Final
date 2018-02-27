using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class GameManager : MonoBehaviour {

    private static GameManager instance;
    public static GameManager Instance { get { return instance; } }

    public const int menuScene = 0;
    public const int gameScene = 1;
    public const int gameOverScene = 2;

	protected PlayerObject playerObject;

	[SerializeField]
    protected float pointsPerSecond = 2f;
	[SerializeField]
    protected float speedUpScore = 100f;
    int speedLevel = 0;

	#region Properties

	public PlayerObject PlayerObject {
		get {
			return playerObject;
		}
	}

	#endregion

    #region Monobehaviour

    // Use this for initialization
    void Awake () {
        if(instance == null)
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
        if (!playerObject)
        {
            GameObject[] p = GameObject.FindGameObjectsWithTag("Player");
            foreach(GameObject o in p)
            {
                playerObject = o.GetComponentInChildren<PlayerObject>();
                if (playerObject) break;
            }
        }

        if (!PlayerPrefs.HasKey("HighScore"))
            PlayerPrefs.SetInt("HighScore", 0);
    }

    void OnDestroy()
    {
        instance = null;
        ScoreManager.UpdateHighScore();
    }

    void SpeedUpCheck()
    {
        int newSpeedLevel = (int) System.Math.Truncate(ScoreManager.Score / (speedUpScore));
        if(newSpeedLevel > speedLevel)
        {
            speedLevel = newSpeedLevel;
            SpeedManager.SpeedUp();
            speedUpScore *= SpeedManager.SpeedUpMultiplier;
            UIController.DisplayMessage("Speed Up!", 1f);
        }
    }
	
	// Update is called once per frame
	void Update () {
        ScoreManager.Score += (pointsPerSecond + playerObject.ScorePickUps) * SpeedManager.SpeedUpMultiplier * Time.deltaTime;

        SpeedUpCheck();
	}

    #endregion

    public static void GameOver()
    {
        ScoreManager.UpdateHighScore();
        ScoreManager.ResetScore();
        SpeedManager.SpeedUpMultiplier = 0f;
        instance.StartCoroutine(instance.ChangeLevel(menuScene, 3f));
    }

    IEnumerator ChangeLevel(int id, float delay = 0f)
    {
        yield return new WaitForSeconds(delay);
        SceneManager.LoadScene(menuScene);   
    }
}
