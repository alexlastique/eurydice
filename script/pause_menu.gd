extends Control

@export var world : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_toggle_game_paused(is_paused : bool):
	if is_paused:
		show()
	else:
		hide() # Replace with function body.


func _on_resume_pressed():
	print(world.gamePaused)
	world.gamePaused = false


func _on_quit_pressed():
	world.gamePaused = false
	get_tree().change_scene_to_file("res://scene/menu.tscn")
