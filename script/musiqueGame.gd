extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var bleu = RigidBody2D.new()
	bleu.set_script(load("res://script/cercle.gd"))
	bleu.mass = 1.0
	add_child(bleu)
	var sprite = Sprite2D.new()
	var texture = load("res://asset/image/bleu.png")
	sprite.texture = texture
	bleu.add_child(sprite)
