extends Node2D
@onready var cattle_spawner: Node2D = $CattleSpawner
@export var level_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CattleSpawner.spawn_cattle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
