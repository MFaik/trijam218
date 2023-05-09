class_name CameraShake
extends Camera2D

@onready var rand = RandomNumberGenerator.new()
var shake_timer := 0.0

func _process(delta):
	if shake_timer > 0:
		shake_timer -= delta
		offset = get_noise_offset(delta, 10)
	else:
		offset = Vector2()

func shake():
	shake_timer = 0.2

func get_noise_offset(delta: float, strength: float) -> Vector2:
	return Vector2(
		rand.randf_range(-strength, strength),
		rand.randf_range(-strength, strength)
	)
