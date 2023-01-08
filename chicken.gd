extends KinematicBody2D

const SPEED = 5

var eating = false
var walking = false

var xdir = 1
var ydir = 1


var motion = Vector2()

var moving_vertical_horizontal = 1

func _ready():
	walking = true
	randomize()

func _physics_process(delta):
	var wait_time = 1
	if walking:
		$AnimatedSprite.play("walking")
		if moving_vertical_horizontal == 1:
			if xdir == -1:
				$AnimatedSprite.flip_h = true
			if xdir == 1:
				$AnimatedSprite.flip_h = false
			motion.x = SPEED * xdir
			motion.y = 0
		elif moving_vertical_horizontal == 2:
			motion.x = 0
			motion.y = SPEED * ydir

	if eating:
		$AnimatedSprite.play("eating")
		motion.x = 0
		motion.y = 0

		var x = rand_range(1,2)
		if x > 1.5:
			moving_vertical_horizontal = 1
		else:
			moving_vertical_horizontal = 2

	move_and_slide(motion)



func _on_change_state_timer_timeout():
	var wait_time = rand_range(1, 5)
	if walking:
		eating = true
		walking = false
	elif eating:
		eating = false
		walking = true

	$change_state_timer.wait_time = wait_time
	$change_state_timer.start()

func _on_walking_timer_timeout():
	var x = rand_range(1, 2)
	var y = rand_range(1, 2)
	var wait_time = rand_range(1, 4)

	if x > 1.5:
		xdir = 1
	else:
		xdir = -1

	if y > 1.5:
		ydir = 1
	else:
		ydir = -1

	$walking_timer.wait_time = wait_time
	$walking_timer.start()
