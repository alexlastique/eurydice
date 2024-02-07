extends Node2D

func _on_fantome_toggle_comabt(is_Combat):
	if (is_Combat):
		hide()
	else :
		show()
