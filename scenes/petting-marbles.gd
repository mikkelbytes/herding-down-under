extends CharacterBody2D

@onready var click_particles: GPUParticles2D = $ClickParticles

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			click_particles.emitting = true
