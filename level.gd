extends Node2D
@onready var cattle_spawner: Node2D = $CattleSpawner
@onready var bg_music: AudioStreamPlayer2D = $BGMusic
@onready var stress: ProgressBar = $Stress
@onready var timer =  $TimerNode/Timer 

@export var level_scene: PackedScene
@export var stress_increase_rate: float = 5.0  
@export var stress_decrease_rate: float = 8.0
@export var max_queen_distance := 80.0

var current_stress_pool: float = 0.0



func _ready() -> void:
	
	$BGMusic.play()

func _process(delta: float):
	#increase stress at half-time
	#if int(timer.get_time_left()) < 15:
		#stress.set_value(stress.value + 2)
		
	#increase stress when dog barks
	
	#increase stress when dog bites
	
	#increase stress when herd separates
	
	var queen = get_tree().get_first_node_in_group("queen_cow")
	var herd = get_tree().get_nodes_in_group("herd")
	
	if queen == null or herd.is_empty():
		return
	var frame_stress_accumulated: float = 0.0

	for cow in herd:
		if cow == queen:
			continue
		var dist = cow.global_position.distance_to(queen.global_position)
		if dist > max_queen_distance:
			frame_stress_accumulated += stress_increase_rate * delta

	if frame_stress_accumulated > 0.0:
		stress.value += frame_stress_accumulated
	else:
		stress.value -= stress_decrease_rate * delta
