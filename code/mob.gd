extends Area2D


var SPEED = 1
var vecx
var vecy
var last_delta=0
var new_delta=0
var col =false
var last_direction=""
var My_group

func _ready():
	$AnimatedSprite2D2.play()
	var screen_size = get_viewport_rect().size
	#mob spawn dans les murs
	vecx =randi_range(0,screen_size.x)
	vecy =randi_range(0,screen_size.y)
	My_group=get_groups()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func _physics_process(delta):
	var player_vars=get_node("/root/Game")
	var Scene_var=get_node("/root/Game")
	new_delta+=delta
	if Scene_var.scene=="combat" or Scene_var.scene == "pause":
		SPEED = 0
	else:
		SPEED = 1
	if is_in_group(My_group[0]):
		if player_vars.positions.x > position.x and SPEED > 0:
			position =Vector2((vecx+1)*SPEED,vecy*SPEED)
			vecx+=1
			last_direction = "vecx+=1"

		if player_vars.positions.x < position.x and SPEED > 0:
			position =Vector2((vecx-1)*SPEED,vecy*SPEED)
			vecx-=1
			last_direction = "vecx-=1"

		if player_vars.positions.y > position.y and SPEED > 0:
			position =Vector2(vecx*SPEED,(vecy+1)*SPEED)
			vecy+=1
			last_direction = "vecy+=1"

		if player_vars.positions.y < position.y and SPEED > 0:
			position =Vector2(vecx*SPEED,(vecy-1)*SPEED)
			vecy-=1
			last_direction = "vecy-=1"

		last_delta=new_delta
	else:
		hide()

func _on_body_entered(body):
	var Scene_var=get_node("/root/Game")
	if body.name=="player" and is_in_group(My_group[0]) and Scene_var.scene != "pause" and Scene_var.scene != "combat":
		Scene_var.scene="combat"
		remove_from_group(My_group[0])
	elif Scene_var.scene != "pause":
		if last_direction == "vecx+=1":
			vecx-=2
		if last_direction == "vecx-=1":
			vecx+=2
		if last_direction == "vecy+=1":
			vecy-=2
		if last_direction == "vecy-=1":
			vecy+=2
	else:
		pass
