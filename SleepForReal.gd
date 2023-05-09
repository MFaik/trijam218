extends Sprite2D

@export var is_end := false
@onready var ui: UISleep = $"../UI"
@onready var camera: CameraShake = $"../Camera2D" 
@onready var sleep: Sprite2D = $"../Sleep"
@onready var awake: Sprite2D = $"../Awake"

var damage_wait_timer := 0.0
var finished := false

func _ready():
	ui.start("Sleep", "WAKE UP!")

func _process(delta: float):
	if damage_wait_timer > 0:
		damage_wait_timer -= delta
	if ui.get_node("VBoxContainer/ProgressBar").value >= 100:
		finished = true
		sleep.visible = true
		awake.visible = false

func _input(event):
	if event is InputEventMouseMotion and damage_wait_timer <= 0 and not finished:
		ui.damage(10) == 0
		damage_wait_timer = 0.6
		ui.play_bed_sound()
