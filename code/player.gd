extends CharacterBody2D


const SPEED = 300.0
var screen_size



func _ready():
	$AnimatedSprite2D.play()

func _physics_process(delta):
	screen_size = get_viewport_rect().size
	var directiony = Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var new_position = position+velocity*delta
	new_position.x = clamp(new_position.x, 0, screen_size.x-200)
	new_position.y = clamp(new_position.y, 0, screen_size.y-200)
	
	position = new_position
	
	var player_positions = get_node("/root/Game")
	player_positions.positions = new_position

	move_and_slide()
