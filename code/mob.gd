extends Area2D


const SPEED = 1
var vecx =Vector2().x
var vecy =Vector2().y
var screen_size
var last_delta=0
var new_delta=0

func _ready():
	var mob_types = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(mob_types[randi() % mob_types.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _physics_process(delta):
	screen_size = get_viewport_rect().size
	var player_vars = get_node("/root/Game")
	var directiony = randi_range(1,4)
	new_delta+=delta
	if true:
		if player_vars.positions.x > position.x :
			position =Vector2((vecx+1)*SPEED,vecy*SPEED)
			vecx+=1

		if player_vars.positions.x < position.x:
			position =Vector2((vecx-1)*SPEED,vecy*SPEED)
			vecx-=1

		if player_vars.positions.y > position.y :
			position =Vector2(vecx*SPEED,(vecy+1)*SPEED)
			vecy+=1
		if player_vars.positions.y < position.y:
			position =Vector2(vecx*SPEED,(vecy-1)*SPEED)
			vecy-=1
		last_delta=new_delta
	#print("true")

func _on_area_2d_body_entered(body):
	print(body)
