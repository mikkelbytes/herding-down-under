extends Node2D

@export var cow_scene: PackedScene
@onready var herd_size: int = randi_range(3, 6)

func _ready() -> void:
	spawn_cattle()

func spawn_cattle():
	if cow_scene == null:
		return

	
	var player_node = get_tree().current_scene.find_child("Player", true, false)

	for i in range(herd_size):
		var new_cow = cow_scene.instantiate() as CharacterBody2D
		
		if player_node:
			new_cow.player = player_node
		
		add_child(new_cow)
		
		
		new_cow.position = Vector2(randf_range(-10, 10), randf_range(-10, 10))
