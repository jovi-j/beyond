extends Camera2D

var shake_duration = 0.5
var shake_amplitude = 100.0
var shake_timer = 0.0
var original_position = Vector2()

func _ready():
	original_position = position

func shake():
	original_position = position
	shake_timer = shake_duration

func _process(delta):
	if shake_timer > 0:
		position = original_position + Vector2(randf_range(-shake_amplitude, shake_amplitude), randf_range(-shake_amplitude, shake_amplitude))
		shake_timer -= delta
	else:
		position = original_position
