extends Node2D

#var number = 5
@export var spawn_speed = 2
@export var pipe_speed  = 1.0

var pipeNode = preload("res://Objects/pipe/pipe.tscn")		# preloading the pipe scene from the file tree (not in the node tree) to instance later
	
@export var gapRange = Vector2(-60, 60)
var offset = 0 # the amount the center of the walls meet (normally at the center of the screen) move in pixels
var bottomLimit = 160 # The size of the y coordinate of the pipe shape used divided by two. Used to find the configration of walls where both the top and bottom walls touch each other with no gape
@export var gapDistance = 30 # The distance of the gap between the two walls divided by two
var generalPosition = bottomLimit + gapDistance # Both the bottom limit position and the gap distance divided by two are added together to make the new position

func _ready():
	global.game_start.connect(_on_game_started)				# connects to the signal emitted from the global script with the function '_on_game_started'

func _on_game_started():
	# this function runs when the game is started (and is received from the signal emitted by the global script)
	start_pipes()		# runs the function below

func start_pipes():
	print('pipes starting!')		# check debugger while the game is running.
	spawn_pipe(-generalPosition)
	spawn_pipe(generalPosition)
	get_node("Timer").start(spawn_speed)		# starts the timer for a time of 'spawn_speed' (set above)
func reset_pipes():
	stop_pipes()
	delete_pipes()
	start_pipes()
func stop_pipes():
	get_node("Timer").stop()
func delete_pipes():
	var pipes = get_tree().get_nodes_in_group("pipes")
	for pipe in pipes:
		pipe.queue_free()
func _on_timer_timeout():			# this is connected using a signal from the child timer Node
	# when the timer finishes, spawn a new pipe and restart the timer
	offset = randf_range(gapRange.x,gapRange.y)
	spawn_pipe(-generalPosition)
	spawn_pipe(generalPosition)
	get_parent().addPipesSpawned(1)
	get_node("Timer").start(spawn_speed)

func spawn_pipe(generalPosition):
	# instances new pipe instances using the preloaded var set above
	var new_pipe = pipeNode.instantiate()	# instances the pipe using the preloaded var
	new_pipe.move_speed = pipe_speed		# accesses the custom 'move_speed' variable used in the pipe script (check pipe.gd) (it moves using that script)
	self.add_sibling(new_pipe) # sets the new pipe to be the sibling of the pipe spawner
	new_pipe.add_to_group("pipes")
	# Math is done here to calculate the general position plus the offset value to allow the wall to shift up and down
	# (Negative and postive values are used according to the direction you want to shift)
	new_pipe.position = self.position + Vector2(0,generalPosition+(-offset) ) # sets the position of the new pipe to be equal to the pipe spawner
	
