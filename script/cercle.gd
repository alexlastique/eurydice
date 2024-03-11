extends RigidBody2D

var defence = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	linear_velocity.y = 600
	if position.y>568:
		defence= true
	if position.y>725:
		free()

func _input(event):
	if event is InputEventKey:
		if 444<position.y and position.y<568:
			if event.is_action("musique1") and is_in_group("bleu"):
				free()
#			if event.is_action("musique1") and is_in_group("bleu"):
#				defence = true
			if event.is_action("musique2") and is_in_group("vert"):
				free()
#			if event.is_action("musique2") and is_in_group("vert"):
#				defence = true
			if event.is_action("musique3") and is_in_group("rouge"):
				free()
#			if event.is_action("musique3") and is_in_group("rouge"):
#				defence = true
			if event.is_action("musique4") and is_in_group("jaune"):
				free()
#			if event.is_action("musique4") and is_in_group("jaune"):
#				defence = true
		else:
			defence = true
