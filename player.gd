extends KinematicBody2D

var speed = 50
var motion = Vector2.ZERO

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("sidewalk")
		$AnimatedSprite.flip_h = true
		motion.x = speed
		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("sidewalk")
		$AnimatedSprite.flip_h = false
		motion.x = -speed
		motion.y = 0
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("downwalk")
		motion.x = 0
		motion.y = speed
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play("upwalk")
		motion.x = 0
		motion.y = -speed
	else:
		$AnimatedSprite.play("idle")
		motion.x = 0
		motion.y = 0

	move_and_slide(motion)

func player_sell():
	pass