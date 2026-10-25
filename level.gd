extends Node2D

const COW_SCENE = preload("res://scenes/cow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var num_cows = randf_range(3, 6)
	
	for i in range(num_cows - 1):
		spawn_cows()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_cows() -> void:
	var cow = COW_SCENE.instantiate()
	cow.position = Vector2(700, 700)
	add_child(cow)
