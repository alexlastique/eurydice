extends Control

@export var GameManager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	GameManager.connect("toggleGamePaused", _on_world_toggle_game_paused)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_world_toggle_game_paused(is_paused : bool):
	if is_paused:
		show()
	else:
		hide() # Replace with function body.


func _on_resume_pressed():
	GameManager.gamePaused = false


func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scene/menu.tscn")
