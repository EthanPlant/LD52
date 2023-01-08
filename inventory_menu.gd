extends StaticBody2D

func _physics_process(delta):
	$carrot_label.text = str(Global.num_of_carrots)
	$onion_label.text = str(Global.num_of_onions)
	$corn_label.text = str(Global.num_of_corn)