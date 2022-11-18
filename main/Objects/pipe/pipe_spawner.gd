extends Node2D			# this node is a marker and doesn't need collisions or sprites or anything, so we will just use Node2D

var pipeNode = preload("res://Objects/pipe/pipe.tscn")		# preloading the pipe scene from the file tree (not in the node tree) to instance later

func spawn_pipe(pipe_speed):
	# instances new pipe instances using the preloaded var set above
	var new_pipe = pipeNode.instantiate()	# instances the pipe using the preloaded var
	new_pipe.move_speed = pipe_speed		# accesses the custom 'move_speed' variable used in the pipe script (check pipe.gd) (it moves using that script)
	self.add_sibling(new_pipe) # sets the new pipe to be the sibling of the pipe spawner
	new_pipe.position = self.position # sets the position of the new pipe to be equal to the pipe spawner
