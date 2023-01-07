extends StaticBody2D

var carrot_value = 5
var onion_value = 8
var corn_value = 15

func _on_Area2D_body_entered(body:Node):
	if body.has_method("player_sell"):
		var carrots = Global.num_of_carrots
		var onions = Global.num_of_onions
		var corn = Global.num_of_corn
		var coins = Global.coins

		coins += carrots * carrot_value
		coins += onions * onion_value
		coins += corn * corn_value

		carrots = 0
		onions = 0
		corn = 0

		Global.num_of_carrots = carrots
		Global.num_of_onions = onions
		Global.num_of_corn = corn
		Global.coins = coins
