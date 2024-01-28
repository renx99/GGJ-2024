extends Node2D

var background:Rect2

# Called when the node enters the scene tree for the first time.
func _ready():
	#get_tree().paused = true
	PhysicsServer2D.set_active(true)
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	
	if $"../../main_game/Player".has_whoopie:
		$"Control/whoopie_graphic".visible = false



func _on_area_2d_body_entered(body):
	if body.has_method("reset_player"):
		body.reset_player()


func _on_goal_body_entered(_body):
	$"../../main_game/Player".has_whoopie = true
	$"../../main_game/Player/whoopie_image".visible = true
	$"../../powerup".play()
	
		
	
	if $"../../main_game/Player".current_door:
		$"../../main_game/Player".current_door.teleport($"../../main_game/Player")
	
	get_tree().paused = false
	$"../../minigame_viewport".visible = false
	call_deferred("queue_free")
