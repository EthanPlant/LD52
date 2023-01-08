extends StaticBody2D

var plant = Global.plant_selelected
var plant_growing = false
var plant_grown = false

func _on_Area2D_area_entered(area:Area2D):
	if not plant_growing:
		if plant == 1:
			plant_growing = true
			$carrot_grow_timer.start()
			$plant.play("carrotgrowing")
		if plant == 2:
			plant_growing = true
			$onion_grow_timer.start()
			$plant.play("oniongrowing")
		if plant == 3:
			plant_growing = true
			$corn_grow_timer.start()
			$plant.play("corngrowing")
		if plant == 4:
			plant_growing = true
			$corn_grow_timer.start()
			$plant.play("cabbagegrowing")
	else:
		print("Plant is already growing here")

func _physics_process(delta):
	if plant_growing == false:
		plant = Global.plant_selelected
		
func _on_onion_grow_timer_timeout():
	var onion_plant = $plant	
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$onion_grow_timer.start()
	elif onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true

func _on_carrot_grow_timer_timeout():
	var carrot_plant = $plant	
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrot_grow_timer.start()
	elif carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true

func _on_corn_grow_timer_timeout():
	var corn_plant = $plant	
	if corn_plant.frame == 0:
		corn_plant.frame = 1
		$corn_grow_timer.start()
	elif corn_plant.frame == 1:
		corn_plant.frame = 2
		plant_grown = true

		
func _on_cabbage_grow_timer_timeout():
	var cabbage_plant = $plant	
	if cabbage_plant.frame == 0:
		cabbage_plant.frame = 1
		$corn_grow_timer.start()
	elif cabbage_plant.frame == 1:
		cabbage_plant.frame = 2
		plant_grown = true

		

func _on_Area2D_input_event(viewport:Node, event:InputEvent, shape_idx:int):
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.num_of_carrots += 1
			elif plant == 2:
				Global.num_of_onions += 1
			elif plant == 3:
				Global.num_of_corn += 1
			elif plant == 4:
				Global.num_of_cabbages += 1
			plant_growing = false
			plant_grown = false
			$plant.play("none")



