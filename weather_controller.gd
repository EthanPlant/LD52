extends StaticBody2D

var current_weather = "none"

func _ready():
	if current_weather == "none":
		$rain.visible = false
		$rain_colour.visible = false
	if current_weather == "rain":
		$rain.visible = true
		$rain_colour.visible = true

func _on_Timer_timeout():
	if current_weather == "none":
		current_weather = "rain"
		$AudioStreamPlayer.play()
		$Timer.wait_time = rand_range(10, 30)
	elif current_weather == "rain":
		current_weather = "none"
		$AudioStreamPlayer.stop()
		$Timer.wait_time = rand_range(20, 60)
	$Timer.start()

func _process(delta):
	Global.weather = current_weather
	if current_weather == "none":
		$rain.visible = false
		$rain_colour.visible = false
	if current_weather == "rain":
		$rain.visible = true
		$rain_colour.visible = true
