extends SubViewport

var minigame_scene = preload("res://scenes/minigame.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_player_play_minigame(_door):
	var minigame = minigame_scene.instantiate()
	add_child(minigame)
	$"../minigame_viewport".visible = true
	$"../main_game".get_tree().paused = true
	PhysicsServer2D.set_active(true)
