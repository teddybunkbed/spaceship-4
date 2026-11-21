extends State

@export var normal_state: State
@export var dodge_state: State
@export var alignment_threshold: float = 5.0

func update(delta: float):
	if (ship.controller.aim_dir.length() > 0):
		ship.flight_component.turn_to(ship.controller.aim_dir, delta)
	elif (ship.controller.move_dir.length() > 0):
		ship.flight_component.turn_to(ship.controller.move_dir, delta)
	
	ship.flight_component.thrust_to(ship.controller.move_dir, ship.controller.thrust, delta)
	
	if (ship.controller.aim_dir.length() == 0 && ship.get_facing_dir().angle_to(ship.controller.move_dir) < deg_to_rad(alignment_threshold)):
		state_machine.change_state(normal_state)
	
	if (ship.controller.dodge):
		state_machine.change_state(dodge_state)
