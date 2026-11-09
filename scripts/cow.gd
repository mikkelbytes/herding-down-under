extends CharacterBody2D

var speed = 100
var player: CharacterBody2D 
var flee_distance: float = 100
var queen: CharacterBody2D 
var is_queen := false

@export var max_queen_distance := 80.0

func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	
	# --- herding ---
	
	if player != null:
		var distance_to_player: float = global_position.distance_to(player.global_position)
		
		if distance_to_player < flee_distance:
			var herded_direction: Vector2 = (global_position.direction_to(player.global_position) * -1.0)
			velocity = herded_direction * speed
			move_and_slide()
			return
			
	# --- stay near queen ---

	if not is_queen and queen != null:
		var distance_to_queen = global_position.distance_to(queen.global_position)
			
		if distance_to_queen > max_queen_distance:
			var direction = global_position.direction_to(queen.global_position)
			velocity = direction * speed
			

	move_and_slide()
