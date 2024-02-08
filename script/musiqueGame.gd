extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var bleu = RigidBody2D.new()
	bleu.set_script(load("res://script/cercle.gd"))
	bleu.mass = 1.0
	bleu.position.x = 0
	bleu.position.y = 0
	bleu.name = "bleu"
	add_child(bleu)
	var spritebleu = Sprite2D.new()
	var texturebleu = load("res://asset/image/bleu.png")
	spritebleu.texture = texturebleu
	bleu.add_child(spritebleu)
	
	
	var vert = RigidBody2D.new()
	vert.set_script(load("res://script/cercle.gd"))
	vert.mass = 1.0
	vert.position.x = 100
	vert.position.y = 0
	vert.name = "vert"
	add_child(vert)
	var spritevert = Sprite2D.new()
	var texturevert = load("res://asset/image/vert.png")
	spritevert.texture = texturevert
	vert.add_child(spritevert)
	
	
	var rouge = RigidBody2D.new()
	rouge.set_script(load("res://script/cercle.gd"))
	rouge.mass = 1.0
	rouge.position.x = 200
	rouge.position.y = 0
	rouge.name = "rouge"
	add_child(rouge)
	var spriterouge = Sprite2D.new()
	var texturerouge = load("res://asset/image/rouge.png")
	spriterouge.texture = texturerouge
	rouge.add_child(spriterouge)
	
	
	var jaune = RigidBody2D.new()
	jaune.set_script(load("res://script/cercle.gd"))
	jaune.mass = 1.0
	jaune.position.x = 300
	jaune.position.y = 0
	jaune.name = "jaune"
	add_child(jaune)
	var spritejaune = Sprite2D.new()
	var texturejaune = load("res://asset/image/jaune.png")
	spritejaune.texture = texturejaune
	jaune.add_child(spritejaune)


func _on_area_2d_2_area_entered(area):
	print(area)
