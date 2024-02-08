extends Node

class_name GameManager

signal toggleGamePaused(is_paused : bool)
signal openOptions(is_options_open : bool)
signal startGame(is_game_started : bool)
signal startFight(is_in_fight : bool)

var gamePaused : bool = false:
	get:
		return gamePaused
	set(value):
		gamePaused = value
		get_tree().paused = gamePaused
		emit_signal("toggleGamePaused", gamePaused)

var optionsOpen : bool = false:
	get:
		return optionsOpen
	set(value):
		optionsOpen = value
		emit_signal("openOptions", optionsOpen)

var inGame : bool = false:
	get:
		return inGame
	set(value):
		inGame = value
		emit_signal("startGame", inGame)

var inFight : bool = false:
	get:
		return inFight
	set(value):
		inFight = value
		emit_signal("startFight", inFight)


func _ready():
	var musique_ambience = get_node("/root/Menu/Control_musique/musique_ambience")


func _input(event : InputEvent):
	if event.is_action_pressed("ui_home") and !optionsOpen and inGame:
		gamePaused = !gamePaused
