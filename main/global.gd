extends Node

#   The GLOBAL script is a script which runs outside of scenes and can be accessible
#   from anywhere in the project. Important common variables and functions are often kept here.

var game_started = false
var game_paused  = false		# unused

func start_game():
	# run everything that should happen when the game starts
	
	game_started = true

func end_game():				# unused
	# run everything that should happen when the game ends
	
	game_started = false
