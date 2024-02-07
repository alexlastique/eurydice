extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity.y = 600
	if position.y>568 and name == "bleu":
		print("phase defense")
	if position.y>725:
		free()

func _input(event):
	if event is InputEventKey:
		if 444<position.y and position.y<568:
			if event.is_action("musique1") and name == "bleu":
				free()
	#		elif event.is_action("musique1") and name != "bleu":
	#			print("phase defense2")
		elif position.y<444 and name == "bleu":
			print("phase defense3")
