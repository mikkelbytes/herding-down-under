extends Marker2D

@export var cow_scene: PackedScene
@onready var herd_size: int = randf_range(3, 6)
@export var spawn_radius: float = 30.0

func _ready() -> void:
	spawn_cattle()

func spawn_cattle():
	if cow_scene == null:
		return


	await get_tree().process_frame
	
	
	var current_level = get_tree().current_scene
	var player_node = get_tree().current_scene.find_child("Player", true, false)
	var queen: CharacterBody2D = null


	for i in range(herd_size):
		var new_cow = cow_scene.instantiate() as CharacterBody2D
		
		
		if player_node:
			new_cow.player = player_node
		
		new_cow.add_to_group("herd")
		current_level.add_child(new_cow)
		
		
		# create the queen
		if i == 0:
			queen = new_cow
			if "is_queen" in queen:
				queen.is_queen = true
				queen.add_to_group("queen_cow")
		else:
			if queen and "queen" in new_cow:
				new_cow.queen = queen
		
		var random_offset = Vector2(
			randf_range(-spawn_radius, spawn_radius),
			randf_range(-spawn_radius, spawn_radius)
		)
		
		new_cow.global_position = global_position + random_offset
		
		
