extends Node2D

#var number = 5
@export var spawn_speed = 1
@export var pipe_speed  = 1.0

var pipeNode = preload("res://Objects/pipe/pipe.tscn")		# preloading the pipe scene from the file tree (not in the node tree) to instance later
	
var offset = 0 # the amount the center of the walls meet (normally at the center of the screen) move in pixels
var bottomLimit = 160 # The size of the y coordinate of the pipe shape used divided by two. Used to find the configration of walls where both the top and bottom walls touch each other with no gape
var gapDistance = 30 # The distance of the gap between the two walls divided by two
var generalPosition = bottomLimit + gapDistance # Both the wall zero position and the gap distance divided by two are added together to make the new position

func _ready():
	get_node("pipe_spawner").position = get_node("pipe_controller").position + Vector2(0,-generalPosition+(-offset) ) # Math is done here to calculate the general position plus the offset value to allow the wall to shift up and down
	get_node("pipe_spawner2").position = get_node("pipe_controller").position + Vector2(0,generalPosition+(-offset) ) # (Negative and postive values are used according to the direction you want to shift)
	global.game_start.connect(_on_game_started)				# connects to the signal emitted from the global script with the function '_on_game_started'

func _on_game_started():
	# this function runs when the game is started (and is received from the signal emitted by the global script)
	start_pipes()		# runs the function below

func start_pipes():
	print('pipes starting!')		# check debugger while the game is running.
	get_node("pipe_spawner").spawn_pipe(pipe_speed)
	get_node("pipe_spawner2").spawn_pipe(pipe_speed)
	get_node("Timer").start(spawn_speed)		# starts the timer for a time of 'spawn_speed' (set above)

func _on_timer_timeout():			# this is connected using a signal from the child timer Node
	# when the timer finishes, spawn a new pipe and restart the timer
	offset = randf_range(-60,60)
	get_node("pipe_spawner").position = get_node("pipe_controller").position + Vector2(0,-generalPosition+(-offset) ) 
	get_node("pipe_spawner2").position = get_node("pipe_controller").position + Vector2(0,generalPosition+(-offset) )
	get_node("pipe_spawner").spawn_pipe(pipe_speed)
	get_node("pipe_spawner2").spawn_pipe(pipe_speed)
	get_node("Timer").start(spawn_speed)

