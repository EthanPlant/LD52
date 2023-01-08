extends StaticBody2D

const LENGTH_OF_DAY = 15
const LENGTH_OF_NIGHT = 8

var state = "day"

var change_state = false

func _ready():
	if state == "day":
		$ColorRect.color.a = 0
	elif state == "night":
		$ColorRect.color.a = 150

func _on_Timer_timeout():
	if state == "day":
		state = "night"
	elif state == "night":
		state = "day"

	change_state = true

func _process(delta):
	if change_state == true:
		change_state = false
		if state == "day":
			change_to_day()
		elif state == "night":
			change_to_night()

func change_to_day():
	$AnimationPlayer.play("night_to_day")
	$Timer.wait_time = LENGTH_OF_DAY
	$Timer.start()

func change_to_night():
	$AnimationPlayer.play("day_to_night")
	$Timer.wait_time = LENGTH_OF_NIGHT
	$Timer.start()
