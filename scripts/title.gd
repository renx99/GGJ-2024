extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("start_game"):
		_on_button_pressed()


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
