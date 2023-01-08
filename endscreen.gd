extends Control

const WIN_STR = "Thanks to you, the festival can go on!"
const LOSE_STR = "Unforunately you didn't make enough money for the festival, better luck next time!"

# Called when the node enters the scene tree for the first time.
func _ready():
	$score_label.text = (" You earned: " + str(Global.total_coins) + " total coins!")
	if Global.total_coins >= Global.WIN_COND:
		$win_loss_label.text = WIN_STR
	else:
		$win_loss_label.text = LOSE_STR
