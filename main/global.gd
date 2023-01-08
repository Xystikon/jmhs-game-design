extends Node

#   The GLOBAL script is a script which runs outside of scenes and can be accessible
#   from anywhere in the project. Important common variables and functions are often kept here.

var game_started = false
var game_paused  = false		# unused

# signals are super useful because they allow code to send outputs without a clear direction and any other node can listen for it
signal game_start()
signal game_end()

func start_game():
	# run everything that should happen when the game starts
	
	game_started = true
	emit_signal("game_start")		# emitting the signal to be picked up by other nodes

func end_game():				# unused
	# run everything that should happen when the game ends
	
	game_started = false
	emit_signal("game_end")
