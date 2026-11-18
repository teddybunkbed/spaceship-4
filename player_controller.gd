extends ShipController

func update():
	var move_input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var aim_input = Input.get_vector("aim_left", "aim_right", "aim_up", "aim_down")
	
	thrust = move_input.length()
	move_dir = Vector3(move_input.x, 0.0, move_input.y).normalized()
	aim_dir = Vector3(aim_input.x, 0.0, aim_input.y).normalized()
	print("balls")
