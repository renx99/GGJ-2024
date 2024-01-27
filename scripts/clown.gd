extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var charge = false 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = 0 
	if $RayCast2D.is_colliding():
		charge = true
		
	if charge:
		direction = -1

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()