extends StaticBody2D

var Pole = preload("res://Levels/Poles.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += Vector2(-2,0)
	print(name)
	print(position.x)
	if position.x < -500:
		Pole_reset()

func Pole_reset():
	var Pole_instance = Pole.instance()
	Pole_instance.position = Vector2(700 + position.x, randi_range(-60+100,60+100))
	queue_free()
	#get_parent().call_deferred("add_child",Pole_instance)
