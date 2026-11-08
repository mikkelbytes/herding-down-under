extends Control
@export var continue_scene_path = "res://scenes/level.tscn"
@export var title_screen_path = "res://scenes/title_screen.tscn"



#########################################


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(title_screen_path)
