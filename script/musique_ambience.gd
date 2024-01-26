extends AudioStreamPlayer

var volume

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_volume_drag_ended(value_changed):
	
	set_volume_db(volume)


func _on_volume_value_changed(value):
	volume = value
