extends Label

func _ready():
	pass

func _process(delta):
	var Piece_var=get_node("/root/Game")
	text = str(Piece_var.piece)
