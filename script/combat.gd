extends Node2D

@export var world : GameManager
@onready var player : CharacterBody2D
@onready var musiqueGame = get_node("/root/main/CanvasLayer/Combat/Control")
var nbgagner = 0
var nbperdu = 0
var mob
var piece
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$player.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if nbgagner+nbperdu==12:
		world.inFight = false
		if nbgagner>nbperdu:
			piece = int(get_node("/root/main/ath/piece/Control/Label").text)+mob.mobLoot["loot"]
		else:
			piece = int(get_node("/root/main/ath/piece/Control/Label").text)
		get_node("/root/main/ath/piece/Control/Label").text = str(piece)
		get_node("Control/AudioStreamPlayer2D").playing = false
		get_node("/root/main/"+world.current_world.name+"/" + mob.name).queue_free()
		musiqueGame.presse = false
		nbgagner = 0
		nbperdu = 0

func _on_main_start_fight(is_in_fight):
	player = get_node("/root/main/"+world.current_world.name+"/player")
	if is_in_fight:
		show()
		$mob.play(mob.name)
	else:
		hide()
