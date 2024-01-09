extends Node2D

var positions
var scene
var group
var piece

func _ready():
	var Piece_var=get_node("/root/Game")
	Piece_var.piece = 0

func _process(delta):
	if group != null:
		print(group[0])
		group = null
