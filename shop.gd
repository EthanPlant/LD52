extends StaticBody2D

func _ready():
	$shop_menu.visible = false

func _process(delta):
	if $shop_menu.corn_owned:
		$corn_seedpack.visible = true
	if $shop_menu.cabbage_owned:
		$cabbage_seedpack.visible = true

func _on_Area2D_body_exited(body:Node):
	$shop_menu.visible = false


func _on_Area2D_body_entered(body:Node):
	if body.has_method("player_shop"):
		$shop_menu.visible = true
