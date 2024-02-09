extends Node2D

signal endCombat(is_Combat : bool)
var mobLoot = {"fantome":{"PV":10,"loot":1,"attack":1}}
var nameEnemy
var prese = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$player.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if (event.is_action("ui_accept") and !prese):
		emit_signal("endCombat", false)
		var piece = int(get_node("/root/main/ath/piece/Control/Label").text)+mobLoot[nameEnemy]["loot"]
		get_node("/root/main/ath/piece/Control/Label").text = str(piece)
		get_node("Control/AudioStreamPlayer2D").playing = false
		get_node("/root/main/world/" + nameEnemy).queue_free()
		prese = true


func _on_fantome_name_pnj(name):
	nameEnemy = name
	$AnimatedSprite2D.play(nameEnemy)
