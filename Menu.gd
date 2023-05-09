extends MarginContainer

func _ready():
	var window = get_window()

	if len(window.get_children()) > 1:
		window.get_child(0).queue_free()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Wakeup.tscn")
	
	var scene = preload("res://Music.tscn")
	var si = scene.instantiate()
	get_window().add_child.call_deferred(si)
