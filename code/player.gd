extends Area2D
signal hit

@export var speed = 1000
var screen_size
var col = 0

func _ready():
	hide()

func _process(delta):
	screen_size=get_viewport_rect().size
	var vel = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		vel.x +=1
	if Input.is_action_pressed("ui_left"):
		vel.x -=1
	if Input.is_action_pressed("ui_down"):
		vel.y +=1
	if Input.is_action_pressed("ui_up"):
		vel.y -=1
	if vel.length()>0:
		vel = vel.normalized()*speed;
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop() 
	position+=vel*delta
	position = position.clamp(Vector2.ZERO,screen_size)


func _on_body_entered(body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled",true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
