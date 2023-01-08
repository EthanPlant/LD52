extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	print("Hi")
	if Input.is_action_just_pressed("click"):
		print("Hi")
		get_tree().change_scene("world.tscn")

