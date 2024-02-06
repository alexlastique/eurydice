extends Node

class_name GameManager

signal toggleGamePaused(is_paused : bool)
signal openOptions(is_options_open : bool)

var optionsOpen : bool = false:
	get:
		return optionsOpen
	set(value):
		optionsOpen = value
		emit_signal("openOptions", optionsOpen)

var gamePaused : bool = false:
	get:
		return gamePaused
	set(value):
		gamePaused = value
		get_tree().paused = gamePaused
		emit_signal("toggleGamePaused", gamePaused)


func _ready():
	var musique_ambience = get_node("/root/Menu/Control_musique/musique_ambience")


func _input(event : InputEvent):
	if event.is_action_pressed("ui_home") and !optionsOpen:
		gamePaused = !gamePaused
