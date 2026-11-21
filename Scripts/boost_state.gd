extends State

@export var normal_state: State
@export var thruster_speed_modifier = 2.0
@export var acceleration_modifier = 2.0
@export var turn_speed_modifier = 0.5

func update(delta: float):
	if (ship.controller.move_dir.length() > 0):
		ship.flight_component.turn_to(ship.controller.move_dir, delta, turn_speed_modifier)
	
	ship.flight_component.thrust_to(ship.get_facing_dir(), ship.controller.thrust, delta, thruster_speed_modifier, acceleration_modifier)
	
	if (!ship.controller.boost):
		state_machine.change_state(normal_state)
