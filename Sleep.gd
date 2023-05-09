extends Sprite2D

@export var is_end := false
@onready var ui: UI = $"../UI"
@onready var camera: CameraShake = $"../Camera2D" 
@onready var sleep: Sprite2D = $"../Sleep"
@onready var awake: Sprite2D = $"../Awake"

var damage_wait_timer := 3.0
var finished := false

func _ready():
	ui.start("Sleep", "WAKE UP!")

func _process(delta: float):
	if damage_wait_timer > 0:
		damage_wait_timer -= delta

func _input(event):
	if event is InputEventMouseMotion and damage_wait_timer <= 0 and not finished:
		if ui.damage(10) == 0:
			finished = true
			sleep.visible = false
			awake.visible = true
		damage_wait_timer = 0.6
