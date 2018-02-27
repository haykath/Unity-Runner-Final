using UnityEngine;
using System.Collections;

public class ScoreManager {

    const float displayScoreMultiplier = 100f;

    private static float score = 0f;
    private static float multiplier = 1f;

    #region Accessors

    public static float Score
    {
        get { return score; }
        set { score = value > 0f ? value * multiplier : 0f; }
    }
    public static float ScoreMultiplier
    {
        get { return multiplier; }
        set { if (value > 0) multiplier = value; }
    }
    public static float DisplayedScore { get { return displayScoreMultiplier * score; } }

    #endregion

    public static void AddScore(float amount)
    {
        Score += amount * multiplier;
    }

    public static void ResetScore()
    {
        score = 0f;
        multiplier = 1f;
    }

    public static void UpdateHighScore()
    {
        if (DisplayedScore > PlayerPrefs.GetInt("HighScore"))
            PlayerPrefs.SetInt("HighScore", (int) DisplayedScore);
    }
}
