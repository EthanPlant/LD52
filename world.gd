extends Node2D


func _physics_process(delta):
	$carrot_text.text = ("= " + str(Global.num_of_carrots))
	$onion_text.text = ("= " + str(Global.num_of_onions))

	$coin_text.text = ("= " + str(Global.coins))
