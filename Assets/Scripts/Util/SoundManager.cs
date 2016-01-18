using UnityEngine;
using System.Collections;

public enum SFX
{
    //Player
    Jump,
    GroundHit,
    Crouch,
    Hit,
    Death,
    Running,
    //Runner
    ScorePickup,
    HealthPickup,
    DeliverPickups,
    //UI
    ButtonClick,
    ButtonHover
}

public enum Music
{
    Game,
    MainMenu
}

public class SoundManager : MonoBehaviour
{

    private static SoundManager instance = null;

    private static float sfxVolume = 1f;
    private static float musicVolume = 1f;

    #region Accessors

    public static float MasterVolume //This is present to use with UI sliders
    {
        get { return AudioListener.volume; }
        set { AudioListener.volume = value > 0f ? value : 0f; }
    }
    public static float SFXVolume
    {
        get { return sfxVolume; }
        set { sfxVolume = value > 0f ? value : 0f; }
    }
    public static float MusicVolume
    {
        get { return musicVolume; }
        set { musicVolume = value > 0f ? value : 0f; }
    }

    #endregion

    #region Sound References
    //Player
    public AudioClip jumpSFX;
    public AudioClip groundHitSFX;
    public AudioClip crouchSFX;
    public AudioClip hitSFX;
    public AudioClip deathSFX;
    //Game
    public AudioClip scorePickupSFX;
    public AudioClip healthPickupSFX;
    public AudioClip deliverPickupsSFX;
    //UI
    public AudioClip buttonClickSFX;
    public AudioClip buttonHoverSFX;

    //Music
    public AudioClip gameMusic;
    public AudioClip menuMusic;

    #endregion

    public AudioSource sfxSource;
    public AudioSource musicSource;

    //Monobehaviour

    void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        else
        {
            DestroyImmediate(gameObject);
        }

        if (sfxSource == null)
        {
            sfxSource = gameObject.AddComponent<AudioSource>();
        }

        if (musicSource == null)
        {
            musicSource = gameObject.AddComponent<AudioSource>();
        }
    }

    void Update()
    {
        sfxSource.volume = sfxVolume;
        musicSource.volume = musicVolume;
    }

    //Instance functions

    public void playSfx(SFX effect, bool loop)
    {
        Debug.Log("Playing sfx: " + effect.ToString());
        AudioClip clip = null;

        switch (effect)
        {
            //Player
            case SFX.Jump:
                clip = jumpSFX;
                break;
            case SFX.GroundHit:
                clip = groundHitSFX;
                break;
            case SFX.Crouch:
                clip = crouchSFX;
                break;
            case SFX.Hit:
                clip = hitSFX;
                break;
            case SFX.Death:
                clip = deathSFX;
                break;
            //Runner
            case SFX.ScorePickup:
                clip = scorePickupSFX;
                break;
            case SFX.HealthPickup:
                clip = healthPickupSFX;
                break;
            case SFX.DeliverPickups:
                clip = deliverPickupsSFX;
                break;
            //UI
            case SFX.ButtonClick:
                clip = buttonClickSFX;
                break;
            case SFX.ButtonHover:
                clip = buttonHoverSFX;
                break;
            default:
                clip = null;
                break;
        }

        if (sfxSource && clip)
        {
            if (loop)
            {
                sfxSource.loop = true;
                sfxSource.Stop();
                sfxSource.clip = clip;
                sfxSource.Play();
            }
            else
            {
                sfxSource.clip = null;
                sfxSource.PlayOneShot(clip);
            }
        }
    }
    public void playSfx(SFX effect)
    {
        playSfx(effect, false);
    }
    public void playSfx(string effectName)
    {
        SFX effect = (SFX)System.Enum.Parse(typeof(SFX), effectName);
        playSfx(effect, false);
    }

    private void stopSFX()
    {
        if (!musicSource)
            return;

        sfxSource.Stop();
    }

    public void changeMusic(Music music)
    {
        Debug.Log("Playing music: " + music.ToString());
        AudioClip clip = null;
        switch (music)
        {
            case Music.Game:
                clip = gameMusic;
                break;
            case Music.MainMenu:
                clip = menuMusic;
                break;
            default:
                clip = null;
                break;
        }

        if (clip && musicSource)
        {
            musicSource.Stop();
            musicSource.clip = clip;
            musicSource.Play();
        }
    }

    private void toggleMusic()
    {
        if (!musicSource)
            return;

        if (musicSource.isPlaying)
            musicSource.Pause();
        else
            musicSource.UnPause();
    }

    //Static functions

    public static void PlaySfx(SFX effect)
    {
        if (instance) instance.playSfx(effect);
        else Debug.LogError("No instance of SoundManager was found.");
    }
    public static void PlaySfx(SFX effect, bool loop)
    {
        if (instance) instance.playSfx(effect, loop);
        else Debug.LogError("No instance of SoundManager was found.");
    }
    public static void PlaySfx(string effect)
    {
        if (instance) instance.playSfx(effect);
        else Debug.LogError("No instance of SoundManager was found.");
    }
    public static void StopSFX()
    {
        if (instance) instance.stopSFX();
        else Debug.LogError("No instance of SoundManager was found.");
    }

    public static void ChangeMusic(Music music)
    {
        if (instance) instance.changeMusic(music);
        else Debug.LogError("No instance of SoundManager was found.");
    }

    public static void ToggleMusic()
    {
        if (instance) instance.toggleMusic();
        else Debug.LogError("No instance of SoundManager was found.");
    }
}
