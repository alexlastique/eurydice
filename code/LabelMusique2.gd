extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	InputMap.action_get_events("musique2")[0].set_keycode(90)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(OS.get_keycode_string(InputMap.action_get_events("musique2")[0].keycode))
