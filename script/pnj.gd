extends CharacterBody2D

var windowsize
var marg = 30
var wanted_pos = position
var moovspeed = 200

func _ready():
	$AnimatedSprite2D.play()

func _physics_process(delta):
	windowsize = get_viewport_rect().size

	wanted_pos = get_local_mouse_position() + position

	if position.distance_to(wanted_pos) > 10.0:
		velocity = (wanted_pos - position).normalized() * moovspeed

	move_and_slide()
	
	
	if velocity.length() > 0 && velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x < 0

	var collision = move_and_collide(velocity * delta)

	# Vérifie s'il y a eu une collision
	if collision:
		if collision.get_collider().get_name() == "player":
			get_tree().change_scene_to_file("res://scene/combat.tscn")
