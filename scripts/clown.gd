extends CharacterBody2D


const SPEED = 1200.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	var direction = 0 
	if $left_ray.is_colliding():
		direction = -1
		$AnimatedSprite2D.play("walk-left")
		
	if $right_ray.is_colliding():
		direction = 1
		$AnimatedSprite2D.play("walk-right")

	if direction:
		$clown_sound.play()
		velocity.x = direction * SPEED
	else:
		$clown_sound2.play()
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i) as KinematicCollision2D
		#print("i'm touching::=", collision.get_collider().name)
		var collided_with = collision.get_collider().name
		if collided_with == "Player":
				get_tree().reload_current_scene()
