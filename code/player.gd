extends CharacterBody2D


const SPEED = 300.0
var screen_size



func _ready():
	$AnimatedSprite2D.play()
	$AnimatedSprite2D2.play()
	var player_positions = get_node("/root/Game")
	player_positions.positions = position
	

func _physics_process(delta):
	var player_positions = get_node("/root/Game")
	screen_size = get_viewport_rect().size

	if player_positions.scene != "pause" and player_positions.scene != "combat":
		if player_positions.positions != position:
			position = player_positions.positions

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

		if not move_and_slide():
			player_positions.positions = new_position

	else:
		set_global_position(Vector2((screen_size.x-200)/2,(screen_size.y-200)/2))

