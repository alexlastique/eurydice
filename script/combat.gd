extends Node2D

@export var world : GameManager
@onready var player : CharacterBody2D = get_node("/root/main/village/player")
var mob
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$player.play("default")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_start_fight(is_in_fight):
	if is_in_fight:
		show()
		$mob.play(mob.name)
		print_debug(mob.name)
	else:
		hide()

#Condition de victoire:
	#world.inFight = False
	#var piece = int(get_node("/root/main/ath/piece/Control/Label").text)+mobLoot[nameEnemy]["loot"]
	#get_node("/root/main/ath/piece/Control/Label").text = str(piece)
	#get_node("Control/AudioStreamPlayer2D").playing = false
	#get_node("/root/main/world/" + nameEnemy).queue_free()
	#prese = true
