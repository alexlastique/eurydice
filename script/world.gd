extends Node

class_name GameManager

signal toggleGamePaused(is_paused : bool)

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
	if(event.is_action_pressed("ui_home")):
		gamePaused = !gamePaused

func _on_parametre_pressed():
	gamePaused = !gamePaused
