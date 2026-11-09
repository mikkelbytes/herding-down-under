extends Control

@onready var level_scene_path = "res://scenes/level.tscn"


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file(level_scene_path)
