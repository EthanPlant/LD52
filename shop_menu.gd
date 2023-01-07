extends StaticBody2D

var item = 1

var corn_price = 100

var corn_owned = false

var price

func _ready():
	$icon.play("cornseed")
	item = 1

func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$icon.play("cornseed")
			$pricelabel.text = str(corn_price)
			if Global.coins >= corn_price:
				if corn_owned == false:
					$buycolour.color = "88119f4c"
				else:
					$buycolour.color = "88d31a1a"
			else:
				$buycolour.color = "88d31a1a"
		# TODO More items

func _on_buybutton_pressed():
	if item == 1:
		price = corn_price
		if Global.coins >= price:
			if corn_owned == false:
				buy()

func _on_rightbutton_pressed():
	swap_item_forward()

func _on_leftbutton_pressed():
	swap_item_back()

func swap_item_back():
	if item == 1:
		item = 1
	else: # Will never happen until more items added
		item -= 1

func swap_item_forward():
		if item == 1:
			item = 1
		else: # Will never happen until more items added
			item += 1

func buy():
	Global.coins -= price
	if item == 1:
		corn_owned = true
