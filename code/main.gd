extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var Scene_var=get_node("/root/Game")
	if Scene_var.scene=="combat":
		$Node2D.visible = true
		$Node2D2.visible = false
		$Node.visible = false
		set_process_input(true)
		
	elif Scene_var.scene =="pause":
		$Node2D.visible = false
		$Node.visible = false
		$Node2D2.visible = true
		set_process_input(true)
		
	else:
		$Node2D.visible = false
		$Node2D2.visible = false
		$Node.visible = true
		set_process_input(true)
		
	if Input.is_action_pressed("ui_accept"):
		Scene_var.piece += 1
		Scene_var.scene = ""
	print(Scene_var.scene)
		

func _input(event):
	var Scene_var=get_node("/root/Game")
	print(Scene_var.scene)
	
	if event.is_action_pressed("pause") and Scene_var.scene == "pause":
		Scene_var.scene=null	
		print("fin pause")
		
	elif event.is_action_pressed("pause") and Scene_var.scene != "combat":
		Scene_var.scene="pause"
		print(Scene_var.scene)
