extends CharacterBody2D

var speed = 100
@export var player = CharacterBody2D
var flee_distance: float = 100.0

func _physics_process(delta: float) -> void:
	if player == null:
		return
	var distance_to_player: float = global_position.distance_to(player.global_position)

	if distance_to_player < flee_distance:
		var herded_direction: Vector2 = global_position.direction_to(player.global_position) * -1.0
		velocity = herded_direction * speed
	else: 
		velocity = Vector2.ZERO
	
	move_and_slide()
