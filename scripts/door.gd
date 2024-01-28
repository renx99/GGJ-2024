extends Area2D

@export var connected_to:Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func teleport(body):
	if connected_to:
		body.global_position = connected_to.global_position
		print(body, connected_to)


func _on_door_body_entered(body):
	if body.has_method("is_touching_door"):
		body.is_touching_door(true, self)

func _on_door_body_exited(body):
	if body.has_method("is_touching_door"):
		body.is_touching_door(false, null)
