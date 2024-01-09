extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var Scene_var=get_node("/root/Game")
	if Scene_var.scene=="combat":
		$Node2D.visible = true
		$Node.visible = false
		set_process_input(false)
	else:
		$Node2D.visible = false
		$Node.visible = true
	if Input.is_action_pressed("ui_accept"):
		Scene_var.piece += 1
		Scene_var.scene = ""
		
