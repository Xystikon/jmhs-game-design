extends Node2D

@export var layer1_speed = 10
@export var layer2_speed = 15
@export var layer3_speed = 25

func _process(delta):
	$layer1.position.x -= layer1_speed * delta
	$layer2.position.x -= layer2_speed * delta
	$layer3.position.x -= layer3_speed * delta

func reset():
	$layer1.position.x = 1800
	$layer2.position.x = 1800
	$layer3.position.x = 1800
