extends CharacterBody2D


const SPEED = 20000

var direction 

signal hit

func _ready():
	connect("hit", $"../../chicken".reset_position)

func _physics_process(delta):


	if direction:
		velocity.x = direction * SPEED * delta 
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	#
	#print(global_position)
	
	if global_position.x > 700 or global_position.x < -100:
		queue_free()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i) as KinematicCollision2D
		#print("i'm touching::=", collision.get_collider().name)
		var collided_with = collision.get_collider().name
		if collided_with.begins_with("chicken"):
			collision.get_collider().emit_signal("reset_position")

func set_direction(dir):
	if dir == 'left':
		direction = -1
	if dir == 'right':
		direction = 1
