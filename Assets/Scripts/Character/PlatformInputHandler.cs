using UnityEngine;
using System.Collections;

[RequireComponent(typeof(PlatformCharacterController))]
public class PlatformInputHandler : MonoBehaviour {

    public bool canJump = true;
    public bool canCrouch = false;

    public bool xMovement = true;
    public bool yMovement = true;

    private PlatformCharacterController player;
    [SerializeField]
    private Vector2 direction = Vector2.zero;

	// Use this for initialization
	void Start () {
        player = GetComponent<PlatformCharacterController>();
	}
	
	// Update is called once per frame
	void Update () {

        if (Input.GetButtonDown("Jump") && canJump)
            player.Jump();

        player.Crouch(Input.GetButton("Crouch") && canCrouch);

        direction.x = xMovement ? Input.GetAxisRaw("Horizontal") : 0f;
        direction.y = yMovement ? Input.GetAxisRaw("Vertical") : 0f;

        player.Move(direction.normalized);
    }
}
