extends Node2D

# Chargez les scènes contenant vos Area2D
var area_scene_1 = preload("res://scene/player.tscn")
var area_scene_2 = preload("res://scene/wall.tscn")

func _ready():
	var area1 = area_scene_1.instance()
	var area2 = area_scene_2.instance()

	add_child(area1)
	add_child(area2)

	area1.add_to_group("VotreGroupe")
	area2.add_to_group("VotreAutreGroupe")
