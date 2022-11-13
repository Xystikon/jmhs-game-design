extends Node2D

var Pole = preload("res://Levels/Poles.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func Pole_reset():
	var Pole_instance = Pole.instance()
	Pole_instance.position = Vector2(450 + position.x, randi_range(-60-472,60-472))
	get_parent().call_deferred("add_child",Pole_instance)
#func _on_resetter_body_entered(body):
	#print(body.name)
	#if body.name == "Poles":
		#body.queue_free()
		#Pole_reset()
