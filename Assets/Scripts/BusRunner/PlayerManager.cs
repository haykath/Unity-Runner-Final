using UnityEngine;
using System.Collections;

[RequireComponent(typeof(DamageableObject))]
public class PlayerManager : MonoBehaviour {

    public DamageableObject damageablePlayer;
    public Rigidbody playerRB;

    [SerializeField]
    private float scorePickUps = 0f;

    #region Accessors

    public float ScorePickUps
    {
        get { return scorePickUps; }
        set { scorePickUps = value > 0f ? value : 0f; }
    }

    #endregion


    void OnPickUp(PickupProperties pickup)
    {
        switch(pickup.type)
        {
            case PickupType.Score:
                scorePickUps += pickup.value;
                break;
            case PickupType.Heal:
                ScoreManager.Score += pickup.value;
                damageablePlayer.Health += pickup.value;
                break;
            default:
                Debug.Log("Empty pickup processed. " + pickup.ToString());
                break;
        }

    }

    void OnDeath()
    {
        Debug.Log("Player died");
        playerRB.isKinematic = false;
        playerRB.useGravity = true;
        playerRB.freezeRotation = false;

        Vector3 direction = new Vector3(1, 1, 0);
        direction.Normalize();

        playerRB.AddForce(direction*500f);
        playerRB.AddTorque(0, 0, -300f);

        GameManager.GameOver();
    }

    void OnHealthChanged(float deltaHealth)
    {
        if(deltaHealth < 0 && scorePickUps > 0f)
        {
            scorePickUps -= 1;
        }
    }

    void ApplyBonusPickup()
    {
        int randomBonus = Mathf.RoundToInt(Random.Range(0f, scorePickUps));
        if (randomBonus > 0f)
        {
            string bonusMessage = string.Format("Bonus: Delivered {0} passenger{1}!", randomBonus, randomBonus == 1 ? "" : "s");
            UIController.DisplayMessage(bonusMessage, 2f);
            ScoreManager.Score += randomBonus * 10;
            scorePickUps -= randomBonus;
        }
    }

    #region Monobehaviour

    void Awake()
    {
        damageablePlayer = GetComponent<DamageableObject>();

        if (!playerRB)
            playerRB = GetComponent<Rigidbody>();

        playerRB.freezeRotation = true;
    }

    #endregion
}
