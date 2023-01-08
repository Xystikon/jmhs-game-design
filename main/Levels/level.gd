extends Node2D

### LEVEL NODE ###
# - in control of all other nodes
# - functions to change game state
# - functions to spawn and kill player
# - counts pipes passed through to get a score

###

# store various other nodes as variables to use within functions
@export var pipeController = get_node("pipe_controller")
@export var background = get_node("background")
@export var playerPreload = preload("res://Player/Player.tscn")
@export var player = get_node("Player")
@export var playerSpawnpoint = get_node("player_spawnpoint")

# set variables
var pipesSpawned = 1
var pipesPassedThrough = 0

# init signals
signal game_started
signal game_over
signal game_reset

func addPipesPassedThrough(pipes):
	pipesPassedThrough += pipes

func addPipesSpawned(pipes):
	pipesSpawned += pipes

func spawnPlayer():
	var temp = playerPreload.instantiate()
	playerSpawnpoint.add_child(temp)
	player = temp
	print(player.position)

func killPlayer():
	if player != null:
		player.queue_free()
		game_over.emit()

func startGame():
	spawnPlayer()
	game_started.emit()

func gameOver():
	killPlayer()

func restartGame():
	killPlayer()
	resetPipes()
	startGame()
	background.reset()
	game_reset.emit()

func resetPipes():
	pipeController.reset_pipes()

func _process(delta):
	print(pipesPassedThrough)
