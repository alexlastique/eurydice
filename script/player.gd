extends CharacterBody2D

@onready var navigation_agent : NavigationAgent2D = $NavigationAgent2D
var moovspeed = 500
var vel
var combat

func _ready():
	$AnimatedSprite2D.play()


func _on_fantome_toggle_comabt(is_Combat):
	combat = is_Combat
	
func _physics_process(delta):
	if (!combat):
		vel = Vector2()
		velocity = vel

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.# Si le bouton droit de la souris est pressé, réinitialiser la position souhaitée
		if Input.is_mouse_button_pressed(1):
			navigation_agent.target_position = get_local_mouse_position() + global_position

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
			navigation_agent.target_position = global_position
			velocity = vel.normalized() * moovspeed
		elif global_position.distance_to(navigation_agent.target_position) > 10.0:
			var direcion = Vector2.ZERO
			direcion = (navigation_agent.get_next_path_position() - global_position).normalized()
			velocity = direcion * moovspeed

		move_and_slide()
		
		if velocity.length() > 0:
			$AnimatedSprite2D.animation = "run"
			$AnimatedSprite2D.flip_h = velocity.x < 0
		else:
			$AnimatedSprite2D.animation = "default"

func _on_area_2d_body_entered(body):
	print_debug(body.name)
