extends State

@export var strafe_state: State
@export var boost_state: State
@export var dodge_state: State

func update(delta: float):
	if (ship.controller.move_dir.length() > 0):
		ship.flight_component.turn_to(ship.controller.move_dir, delta)
	
	ship.flight_component.thrust_to(ship.get_facing_dir(), ship.controller.thrust, delta)
	
	if (ship.controller.aim_dir.length() > 0):
		state_machine.change_state(strafe_state)
	
	if (ship.controller.dodge):
		state_machine.change_state(dodge_state)
	
	if (ship.controller.boost):
		state_machine.change_state(boost_state)
