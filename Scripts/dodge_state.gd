extends State

@export var normal_state: State
@export var speed_modifier: float = 1.5
@export var acceleration_modifier: float = 10.0
@export var dodge_duration: float = 0.2

var dodge_timer: float
var dodge_dir: Vector3

func enter():
	print("dodge")
	dodge_timer = dodge_duration
	if (ship.controller.move_dir.angle_to(ship.get_facing_dir()) < deg_to_rad(45.0)):
		dodge_dir = ship.get_facing_dir()
	elif (ship.controller.move_dir.angle_to(ship.get_facing_dir()) > deg_to_rad(135.0)):
		dodge_dir = -ship.get_facing_dir()
	else:
		if (ship.controller.move_dir.angle_to(ship.model.basis.x) <= deg_to_rad(45.0)):
			dodge_dir = ship.model.basis.x
		else:
			dodge_dir = -ship.model.basis.x
	
func update(delta: float):
	if (dodge_timer <= 0):
		state_machine.change_state(normal_state)
		ship.model.rotation.z = 0.0
	else:
		dodge_timer -= delta
		ship.flight_component.thrust_to(dodge_dir, 1, delta, speed_modifier, acceleration_modifier)
		ship.model.rotation.z = deg_to_rad(360) * (dodge_timer / dodge_duration)
