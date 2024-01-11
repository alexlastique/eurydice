extends Node2D

var positions
var scene
var group
var piece

func _ready():
	var Piece_var=get_node("/root/Game")
	Piece_var.piece = load_game()

func _process(delta):
	if group != null:
		print(group[0])
		group = null

func _input(event):
	if event.is_action("ui_home"):
		save_game()


func save_game():
	var save_game = FileAccess.open("savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	
	for node in save_nodes:

		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		var node_data = node.call("save")

		var json_string = JSON.stringify(node_data)

		save_game.store_line(json_string)


func load_game():
	if not FileAccess.file_exists("savegame.save"):
		return 0

	var save_game = FileAccess.open("savegame.save", FileAccess.READ)
	while save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var node_data = json.get_data()
		for i in node_data:
			if i == "piece":
				return(node_data["piece"])
