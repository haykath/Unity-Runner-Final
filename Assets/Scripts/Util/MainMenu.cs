using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System.Collections;

public class MainMenu : MonoBehaviour
{

    public Text highScoreText;

    int highScore = 0;

    // Use this for initialization
    void Start()
    {

        if (highScoreText)
        {
            if (!PlayerPrefs.HasKey("HighScore"))
                PlayerPrefs.SetInt("HighScore", 0);
            highScore = PlayerPrefs.GetInt("HighScore");
            highScoreText.text = string.Format("HIGH SCORE: {0}", highScore);
        }

    }

    public void NewGame()
    {
        SceneManager.LoadScene(GameManager.gameScene);
    }

    public void Quit()
    {
        Application.Quit();
    }

}
