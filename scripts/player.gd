extends CharacterBody2D


const SPEED = 1200.0
const JUMP_VELOCITY = -900.0
const WHOOPIE = 2.2
var has_whoopie = false 
var touching_door = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal play_minigame

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
		if Input.is_action_pressed("WHOOPIE") and is_on_floor() and has_whoopie:
			velocity.y = velocity.y * WHOOPIE

	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		if Input.is_action_pressed("WHOOPIE") and is_on_floor() and has_whoopie:
			velocity.x = velocity.x * WHOOPIE
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	# box pushing logic
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i) as KinematicCollision2D
		#print("i'm touching::=", collision.get_collider().name)
		var collided_with = collision.get_collider().name
		
		if collided_with.begins_with("movable_box"):
			#print("i'm touching::=", collision)
			collision.get_collider().apply_central_impulse(Vector2(direction * 20, 0))
		if collided_with == "clown":
			print("caught by clown")
	# open door logic
	if Input.is_action_just_pressed("Open Door") and touching_door:
		#has_whoopie = true
		emit_signal("play_minigame")
	
func is_touching_door(status:bool):
	touching_door = status 
	
func reset_level():
	get_tree().reload_current_scene()
