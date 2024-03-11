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

signal openOptions(is_options_open : bool)
var optionsOpen : bool = false:
	get:
		return optionsOpen
	set(value):
		optionsOpen = value
		emit_signal("openOptions", optionsOpen)

signal startGame(is_game_started : bool)
var inGame : bool = false:
	get:
		return inGame
	set(value):
		inGame = value
		emit_signal("startGame", inGame)

signal startFight(is_in_fight : bool)
var inFight : bool = false:
	get:
		return inFight
	set(value):
		inFight = value
		emit_signal("startFight", inFight)

func _ready():
	var scene = preload("res://scene/village.tscn")
	current_world = scene.instantiate()
	
var current_world;
func _on_start_game(is_game_started):
	if is_game_started:
		add_child(current_world)
	else:
		current_world.queue_free()

func _input(event : InputEvent):
	if event.is_action_pressed("ui_home") and !optionsOpen and inGame:
		gamePaused = !gamePaused
