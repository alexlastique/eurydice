extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$piece.play()


func _on_fantome_toggle_combat(is_Combat):
	if (is_Combat):
		hide()
	else :
		show()
