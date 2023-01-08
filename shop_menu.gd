extends StaticBody2D

const RED = "88d31a1a"
const GREEN = "88119f4c"

var item = 1

const corn_price = 100
const cabbage_price = 250

var corn_owned = false
var cabbage_owned = false

var price

func _ready():
	$icon.play("cornseed")
	item = 1

func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$icon.play("cornseed")
			$pricelabel.text = (" " + str(corn_price))
			if Global.coins >= corn_price:
				if not corn_owned:
					$buycolour.color = GREEN
				else:
					$buycolour.color = RED
			else:
				$buycolour.color = RED

		elif item == 2:
			$icon.play("cabbageseed")
			$pricelabel.text = (" " + str(cabbage_price))
			if Global.coins >= cabbage_price:
				if not cabbage_owned:
					$buycolour.color = GREEN
				else:
					$buycolour.color = RED
			else:
				$buycolour.color = RED

func _on_buybutton_pressed():
	if item == 1:
		price = corn_price
		if Global.coins >= price:
			if corn_owned == false:
				buy()
	
	elif item == 2:
		price = cabbage_price
		if Global.coins >= price:
			if not cabbage_owned:
				buy()

func _on_rightbutton_pressed():
	swap_item_forward()

func _on_leftbutton_pressed():
	swap_item_back()

func swap_item_back():
	if item == 1: 
		item = 2 # Last item
	else: 
		item -= 1

func swap_item_forward():
		if item == 2: # Last item
			item = 1
		else:
			item += 1

func buy():
	Global.coins -= price
	$AudioStreamPlayer.play()
	if item == 1:
		corn_owned = true
	elif item == 2:
		cabbage_owned = true
