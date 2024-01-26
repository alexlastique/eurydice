extends Control



# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()

func _on_retour_pressed():
	hide()

func _on_modifie_les_touches_pressed():
	show()

func save_game():
	var save_game1 = FileAccess.open("option.txt", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	
	for node in save_nodes:

		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		var node_data = node.call("save")

		var json_string = JSON.stringify(node_data)

		save_game1.store_line(json_string)

func load_game():
	if not FileAccess.file_exists("option.txt"):
		return 0

	var save_game2 = FileAccess.open("option.txt", FileAccess.READ)
	while save_game2.get_position() < save_game2.get_length():
		var json_string = save_game2.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue

		var node_data = json.get_data()
		for i in node_data:
			var touche = InputEventKey.new()
			touche.set_keycode(OS.find_keycode_from_string(node_data[i].get_slice("=",1).get_slice(" ",1).get_slice("(",1).get_slice(")",0)))
			if i == "ui_up":
				InputMap.action_erase_events("ui_up")
				InputMap.action_add_event("ui_up", touche)
			if i == "ui_down":
				InputMap.action_erase_events("ui_down")
				InputMap.action_add_event("ui_down", touche)
			if i == "ui_left":
				InputMap.action_erase_events("ui_left")
				InputMap.action_add_event("ui_left", touche)
			if i == "ui_right":
				InputMap.action_erase_events("ui_right")
				InputMap.action_add_event("ui_right", touche)
			if i == "ui_accept":
				InputMap.action_erase_events("ui_accept")
				InputMap.action_add_event("ui_accept", touche)
			if i == "ui_cancel":
				InputMap.action_erase_events("ui_cancel")
				InputMap.action_add_event("ui_cancel", touche)
			if i == "ui_home":
				InputMap.action_erase_events("ui_home")
				InputMap.action_add_event("ui_home", touche)
			if i == "musique1":
				InputMap.action_erase_events("musique1")
				InputMap.action_add_event("musique1", touche)
			if i == "musique2":
				InputMap.action_erase_events("musique2")
				InputMap.action_add_event("musique2", touche)
			if i == "musique3":
				InputMap.action_erase_events("musique3")
				InputMap.action_add_event("musique3", touche)
			if i == "musique4":
				InputMap.action_erase_events("musique4")
				InputMap.action_add_event("musique4", touche)

func _on_exit_pressed():
	save_game()

func _on_play_pressed():
	save_game()
