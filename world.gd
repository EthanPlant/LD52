extends Node2D

var inventory_open = false

func _physics_process(delta):
	$coin_text.text = (" " + str(Global.coins))

func _input(event):
	if event.is_action_pressed("inventory"):
		print("Hi")
		if inventory_open:
			$inventory.visible = false
			inventory_open = false
		else:
			$inventory.visible = true
			inventory_open = true
