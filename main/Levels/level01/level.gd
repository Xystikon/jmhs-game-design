extends Node2D

var pipeController = get_node("pipe_controller")
var playerPreload = preload("res://Player/Player.tscn")
var player = get_node("Player")
var spawnLocation = Vector2(42, 151)
signal game_started
signal game_over
signal game_reset
func spawnPlayer():
	if player == null:
		player = playerPreload.instantiate()
		player.set_sleeping(true)
		player.position = spawnLocation
		player.set_sleeping(false)
		#add_child(player)
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
	pass
