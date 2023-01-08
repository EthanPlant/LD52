extends StaticBody2D

const carrot_value = 5
const onion_value = 8
const corn_value = 15
const cabbage_value = 25

func _on_Area2D_body_entered(body:Node):
	if body.has_method("player_sell"):
		var carrots = Global.num_of_carrots
		var onions = Global.num_of_onions
		var corn = Global.num_of_corn
		var cabbages = Global.num_of_cabbages
		var coins = Global.coins
		var total_coins = Global.total_coins

		if carrots > 0 or onions > 0 or corn > 0 or cabbages > 0:
			$AudioStreamPlayer.play()

		coins += carrots * carrot_value
		coins += onions * onion_value
		coins += corn * corn_value
		coins += cabbages * cabbage_value

		total_coins += carrots * carrot_value
		total_coins += onions * onion_value
		total_coins += corn * corn_value
		total_coins += cabbages * cabbage_value

		carrots = 0
		onions = 0
		corn = 0
		cabbages = 0

		Global.num_of_carrots = carrots
		Global.num_of_onions = onions
		Global.num_of_corn = corn
		Global.num_of_cabbages = cabbages
		Global.coins = coins
		Global.total_coins = total_coins

		
