extends Area2D

@export var move_speed = 1.0			# also set using the pipe_spawner script
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position -= Vector2(move_speed, 0)	# move position with the 'move_speed' variable


func _on_area_entered(area):
	print("passed through")
	get_parent().addPipesPassedThrough(1)
