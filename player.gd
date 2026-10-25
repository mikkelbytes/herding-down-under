extends CharacterBody2D

@export var speed := 145
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var facing_direction: String = "S"

func _ready() -> void:
	update_animation(false)


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction:
		velocity = direction * speed
		facing_direction = determine_direction(direction)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	var is_moving = (direction != Vector2.ZERO)
	update_animation(is_moving)


	move_and_slide()


	if get_slide_collision_count() > 0:
		velocity = Vector2.ZERO

func determine_direction(dir: Vector2) -> String:
	if abs(dir.x) > abs(dir.y):
		return "E" if dir.x > 0 else "W"
	else:
		return "S" if dir.y > 0 else "N"
		
func update_animation(is_moving: bool) -> void:
	animated_sprite.flip_h = false
	animated_sprite.flip_v = false
	# var state_prefix = "walk_" if is_moving else "idling_"
	var state_prefix = "idling_"
	animated_sprite.play(state_prefix + facing_direction)
