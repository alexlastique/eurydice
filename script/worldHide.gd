extends Node2D

func _ready():
	hide()
	get_tree().paused = true

func _on_main_start_game(is_game_started):
	if is_game_started:
		get_tree().paused = false
		show()
	else:
		get_tree().paused = true
		hide()

func _on_fantome_toggle_comabt(is_Combat):
	if (is_Combat):
		get_tree().paused = true
		hide()
	else :
		get_tree().paused = false
		show()
