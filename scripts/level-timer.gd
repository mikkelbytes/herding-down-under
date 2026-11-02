extends Control

@export var time_left_seconds: int = 120  # Starting countdown time in seconds
@onready var timer: Timer = $Timer
@onready var label: RichTextLabel = $Label

func _ready() -> void:
	timer.wait_time = 1.0
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	
	update_label()
	timer.start()

func _on_timer_timeout() -> void:
	if time_left_seconds > 0:
		time_left_seconds -= 1
		update_label()
	else:
		timer.stop()
		## change to gameover scene
		
func update_label() -> void:
	var minutes: int = time_left_seconds / 60
	var seconds: int = time_left_seconds % 60
	label.text = "%02d:%02d" % [minutes, seconds]
