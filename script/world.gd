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

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		gamePaused = !gamePaused

func _on_parametre_pressed():
	gamePaused = !gamePaused
