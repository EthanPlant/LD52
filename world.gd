extends Node2D

var inventory_open = false

func _physics_process(delta):
	$ui/coin_text.text = (" " + str(Global.coins))

func _input(event):
	if event.is_action_pressed("inventory"):
		if inventory_open:
			$ui/inventory.visible = false
			inventory_open = false
		else:
			$ui/inventory.visible = true
			inventory_open = true
