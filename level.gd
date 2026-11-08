extends Node2D
@onready var cattle_spawner: Node2D = $CattleSpawner
@export var level_scene: PackedScene
@onready var bg_music: AudioStreamPlayer2D = $BGMusic
@onready var progress_bar: ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CattleSpawner.spawn_cattle()
	$BGMusic.play()
	$ProgressBar.set_value(4)
