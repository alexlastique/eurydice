extends CharacterBody2D


@export var moovspeed = 500
var vel = Vector2()
var wanted_pos = position
var windowsize
var marg = 30

func _ready():
	$AnimatedSprite2D.play()


func _physics_process(delta):
	windowsize = get_viewport_rect().size
	vel = Vector2()
	velocity = vel

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.# Si le bouton droit de la souris est pressé, réinitialiser la position souhaitée
	if Input.is_mouse_button_pressed(1):
		wanted_pos = get_local_mouse_position() + position

	# Si la distance entre la position actuelle et la position souhaitée est supérieure à 50, déplacer
	if Input.is_action_pressed("ui_up"):
		vel.y -= 1
	if Input.is_action_pressed("ui_down"):
		vel.y += 1
	if Input.is_action_pressed("ui_left"):
		vel.x -= 1
	if Input.is_action_pressed("ui_right"):
		vel.x += 1
	if vel:
		wanted_pos = position
		velocity = vel.normalized() * moovspeed
	elif position.distance_to(wanted_pos) > 10.0:
		velocity = (wanted_pos - position).normalized() * moovspeed

	move_and_slide()
	
	if velocity.length() > 0:
		if velocity.x != 0:
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_h = velocity.x < 0
		elif velocity.y > 0:
			$AnimatedSprite2D.animation = "down"
		else:
			$AnimatedSprite2D.animation = "up"
	else:
		$AnimatedSprite2D.animation = "default"
