extends Button

var touch = InputEventMouseMotion.new()
var classEventKey = InputEventKey.new()
var buttonPressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.get_class() == classEventKey.get_class() and buttonPressed:
		touch = event

func _on_pressed():
	buttonPressed=true
	if touch.get_class() == classEventKey.get_class():
		InputMap.action_erase_events("ui_home")
		InputMap.action_add_event("ui_home", touch)
