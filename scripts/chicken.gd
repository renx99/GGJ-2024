extends CharacterBody2D


const SPEED = 6000.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func on_ready():
	position = Vector2(300, 512)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("Left", "Right", "UP", "DOWN")
	
	velocity = direction * SPEED * delta

	move_and_slide()


func reset_position():
	position = Vector2(300, 512)
