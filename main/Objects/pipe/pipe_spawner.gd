extends Node2D			# this node is a marker and doesn't need collisions or sprites or anything, so we will just use Node2D

@export var spawn_speed = 2.0		# @export once again makes the variable visible in the Inspector 
@export var pipe_speed  = 1.0

var pipeNode = preload("res://Objects/pipe/pipe.tscn")		# preloading the pipe scene from the file tree (not in the node tree) to instance later

func _ready():
	global.game_start.connect(_on_game_started)				# connects to the signal emitted from the global script with the function '_on_game_started'

func _on_game_started():
	# this function runs when the game is started (and is received from the signal emitted by the global script)
	start_pipes()		# runs the function below

func start_pipes():
	print('pipes starting!')		# check debugger while the game is running. 
	spawn_pipe()
	$timer.start(spawn_speed)		# starts the timer (referencing to the child node with '$') for a time of 'spawn_speed' (set above)

func spawn_pipe():
	# instances new pipe instances using the preloaded var set above
	var new_pipe = pipeNode.instantiate()	# instances the pipe using the preloaded var
	new_pipe.move_speed = pipe_speed		# accesses the custom 'move_speed' variable used in the pipe script (check pipe.gd) (it moves using that script)
	self.add_child(new_pipe)				# adds the pipe as a child to the pipe_spawner Node

func _on_timer_timeout():			# this is connected using a signal from the child timer Node
	# when the timer finishes, spawn a new pipe and restart the timer
	spawn_pipe()
	$timer.start(spawn_speed)
