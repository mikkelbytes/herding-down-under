extends Control

const START_SCENE_PATH = "res://scenes/level.tscn"

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(START_SCENE_PATH)



func _process(_delta: float) -> void:
	# Checks if the physical Escape key is pressed
	if Input.is_key_pressed(KEY_F4):
		get_tree().quit()

	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_button_pressed() -> void:
	pass # Replace with function body.
