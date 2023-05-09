extends Node2D

@onready var ui: UI = $"../UI"
var eat_timer := 3.0
var cnt = 0

func _ready():
	ui.start("Meal", "EAT!")


func _process(delta):
	if eat_timer > 0:
		eat_timer -= delta


func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed\
		and eat_timer <= 0:
		ui.damage(20) > 0
		eat_timer = 1
		get_children()[cnt].visible = false
		cnt += 1
		get_children()[cnt].visible = true
