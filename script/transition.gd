extends Node2D


@onready var world = get_node("/root/main")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _on_transition_body_entered(body):
	#if body.name=="player":
		#if world.current_world.name=="dongeon":
			#world.scene = preload("res://scene/village.tscn")
			#world.current_world = world.scene.instantiate()
			#world.add_child(world.current_world)
		#elif world.current_world.name=="village":
			#world.scene = preload("res://scene/dongeon.tscn")
			#world.current_world = world.scene.instantiate()
			#world.add_child(world.current_world)


func _on_transition_to_village_body_entered(body):
	if body.name=="player":
		world._change_map("village")


func _on_transition_to_dongeon_body_entered(body):
	if body.name=="player":
		world._change_map("dongeon")
