extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_fantome_toggle_combat(is_Combat):
	if (is_Combat):
		show()
		get_node("/root/Menu/Control_musique/musique_ambience").stream_paused = true
	else :
		hide()
		get_node("/root/Menu/Control_musique/musique_ambience").stream_paused = false
