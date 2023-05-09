class_name UI
extends MarginContainer

@onready var name_label : Label = $VBoxContainer/Label
@onready var start_label : Label = $Start
@onready var end_label : Label = $End
@onready var animation : AnimationPlayer = $AnimationPlayer
@onready var progress_bar : ProgressBar = $VBoxContainer/ProgressBar
@onready var camera : CameraShake = $"../Camera2D"
@onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer
@export var next_scene : Resource

@export var eat_sounds : Array[Resource]
@export var kb_sounds : Array[Resource]
@export var bed_sounds : Array[Resource]

@onready var sounds = {
	"wake": bed_sounds,
	"eat": eat_sounds,
	"mail": kb_sounds,
}

func start(name: String, start: String) -> void:
	name_label.text = name
	start_label.text = start
	start_label.visible = true
	end_label.visible = false
	animation.play("Fight Start")

func damage(value: int) -> int:
	camera.shake()
	progress_bar.value -= value
	if progress_bar.value <= 0:
		end_label.visible = true
		animation.play("Fight End")
	return progress_bar.value

func play_sound(type: String):
	audio_player.stream = sounds[type][randi() % len(sounds[type])]
	audio_player.play()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Fight Start":
		progress_bar.value = 100
		start_label.visible = false
	else:
		end_label.visible = false
		get_tree().change_scene_to_packed(next_scene)
