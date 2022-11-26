extends Node2D

@export var pipeController = get_node("pipe_controller")
var playerPreload = preload("res://Player/Player.tscn")
@export var player = get_node("Player")
@export var playerSpawnpoint = get_node("player_spawnpoint")
var pipesSpawned = 1
var pipesPassedThrough = 0
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
	#if player == null:
		#var temp = playerPreload.instantiate()
		#playerSpawnpoint.add_child(temp)
		#player = temp
		#print(player.position)
		#player.set_physics_process(false)
		#player.set_sleeping(true)
		
		#player.position = spawnLocation
		#player.set_pos(spawnLocation)
		
		#player.set_physics_process(true)
		#player.set_sleeping(false)
		
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
	game_reset.emit()
func resetPipes():
	pipeController.reset_pipes()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(pipesPassedThrough)
	#print(pipesSpawned)
	#if player != null:
		#print(player.position)
