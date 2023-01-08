extends Node2D

const WIN_COND = 5000

var inventory_open = false

func _physics_process(delta):
	$ui/coin_text.text = (" " + str(Global.coins))
	$ui/day_label.text = (" Day " + str(Global.day))

	if Global.day == 8:
		if Global.total_coins >= WIN_COND:
			print("You win!")
		else:
			print("You lost :(")

func _input(event):
	if event.is_action_pressed("inventory"):
		if inventory_open:
			$ui/inventory.visible = false
			inventory_open = false
		else:
			$ui/inventory.visible = true
			inventory_open = true
