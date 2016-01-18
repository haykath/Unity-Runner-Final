using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Rigidbody))]
public class PlatformCharacterController : MonoBehaviour {

    #region Enums and constants

    public enum PlayerState
    {
        None = 0,
        Grounded = 1 << 0,
        Crouching = 1 << 1,
        Dead = 1 << 2
    }

    #endregion

    #region Public Variables

    public PlayerState currentState = PlayerState.None;

    public float speed = 5f;
    public float jumpSpeed = 5f;

    public float crouchSizeMultiplier = 0.6f; //Temporary

    public Vector3 gravity = Physics.gravity;

    public string groundTagName = "Ground";

    public bool useFixedTimeStep = false;

    public new Renderer renderer;
    public new Collider collider;

    #endregion

    #region Private and protected variables

    private new Rigidbody rigidbody;

    private Vector3 currentMovementSpeed;
    private Vector3 currentJumpingSpeed;
    private Vector3 standingCenter;
    private float standingHeight; //Temporary

    private float TimeStep { get { return useFixedTimeStep ? Time.fixedDeltaTime : Time.deltaTime; } }

    #endregion
	
	public void Move(Vector3 direction)
    {
        if (Util.CheckFlag<PlayerState>(currentState, PlayerState.Dead))
            return;

        currentMovementSpeed = direction.normalized * speed;
    }

    public void Jump()
    {
        if (Util.CheckFlag<PlayerState>(currentState, PlayerState.Dead)
            || !Util.CheckFlag<PlayerState>(currentState, PlayerState.Grounded))
        {
            return;
        }

        if (Util.CheckFlag<PlayerState>(currentState, PlayerState.Crouching))
            Crouch(false);

        currentJumpingSpeed += jumpSpeed * -gravity.normalized;
        currentState &= ~PlayerState.Grounded;

        SoundManager.StopSFX();
        SoundManager.PlaySfx(SFX.Jump);
    }

    public void Crouch(bool active)
    {
        if (Util.CheckFlag<PlayerState>(currentState, PlayerState.Dead) || !Util.CheckFlag<PlayerState>(currentState, PlayerState.Grounded))
            return;

        if (active && !Util.CheckFlag<PlayerState>(currentState, PlayerState.Crouching))
        {
            currentState |= PlayerState.Crouching;

            standingCenter = transform.position;
            standingHeight = transform.localScale.y;

            Vector3 scale = transform.localScale;
            Vector3 position = transform.position;

            position.y -= crouchSizeMultiplier;
            scale.y *= crouchSizeMultiplier;

            transform.position = position;
            transform.localScale = scale;

            if (Util.CheckFlag<PlayerState>(currentState, PlayerState.Grounded))
            {
                    SoundManager.PlaySfx(SFX.Crouch, true);
            }
        }
        else if (!active && Util.CheckFlag<PlayerState>(currentState, PlayerState.Crouching))
        {
            currentState &= ~PlayerState.Crouching;

            Vector3 scale = transform.localScale;
            Vector3 position = transform.position;

            position = standingCenter;
            scale.y = standingHeight;

            transform.position = position;
            transform.localScale = scale;

            if (Util.CheckFlag<PlayerState>(currentState, PlayerState.Grounded))
            {
                SoundManager.PlaySfx(SFX.Running, true);
            }
        }
    }

    void ApplyGravity()
    {
        if (!Util.CheckFlag<PlayerState>(currentState, PlayerState.Grounded)) //if player is not grounded
        {
            currentJumpingSpeed += gravity * TimeStep;
        }
        else
            currentJumpingSpeed = Vector3.zero;
    }

    void OnDeath()
    {
        gravity = Vector3.zero;
        Crouch(false);
        currentState |= PlayerState.Dead;
        SoundManager.PlaySfx(SFX.Death);
    }

    void OnHealthChanged(float deltaHealth)
    {
        if(deltaHealth < 0)
        {
            SoundManager.PlaySfx(SFX.Hit);
        }
    }

    #region Monobehaviour
    // Use this for initialization
    void Awake()
    {
        if (!renderer)
            renderer = GetComponent<Renderer>();

        collider = GetComponent<Collider>();
        rigidbody = GetComponent<Rigidbody>();

        standingHeight = transform.localScale.y;
    }

    void Update()
    {
        if (useFixedTimeStep)
            return;

        ApplyGravity();

        Vector3 deltaPos = currentMovementSpeed + currentJumpingSpeed * Time.deltaTime;

        //transform.position += deltaPos;
        rigidbody.MovePosition(transform.position + deltaPos);
    }

    void FixedUpdate()
    {
        if (!useFixedTimeStep)
            return;

        ApplyGravity();

        Vector3 deltaPos = currentMovementSpeed + currentJumpingSpeed * Time.fixedDeltaTime;

        //transform.position += deltaPos;
        rigidbody.MovePosition(transform.position + deltaPos);
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.blue;
        Gizmos.DrawWireCube(renderer.bounds.center, renderer.bounds.size);
    }

    void OnCollisionEnter(Collision col)
    {
        if(col.collider.tag == groundTagName)
        {
            currentState |= PlayerState.Grounded;
            SoundManager.PlaySfx(SFX.GroundHit);
            SoundManager.PlaySfx(SFX.Running, true);
        }
    }
    
    void OnCollisionStay(Collision col)
    {
        if(col.collider.tag == groundTagName)
        {
            currentState |= PlayerState.Grounded;
        }
    }
    #endregion
}
