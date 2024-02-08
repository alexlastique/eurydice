extends Node2D

@export var world : GameManager

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
	else:
		hide()
