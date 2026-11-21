class_name FlightComponent extends Node

@export var ship: Ship
@export var thruster_speed: float = 20.0
@export var turn_speed: float = 3.0
@export var acceleration: float = 20.0

func turn_to(dir: Vector3, delta: float, turn_speed_modifier: float = 1.0):
	if ship:
		var target_yaw = atan2(dir.x, dir.z)
		var yaw_diff = angle_difference(ship.get_facing_yaw(), target_yaw)
		ship.set_facing_yaw(ship.get_facing_yaw() + clampf(yaw_diff, -turn_speed * turn_speed_modifier * delta, turn_speed * turn_speed_modifier * delta))

func thrust_to(dir: Vector3, thrust: float, delta: float, thruster_speed_modifier: float = 1.0, acceleration_modifier: float = 1.0):
	if ship:
		ship.velocity = ship.velocity.move_toward(dir * thrust * thruster_speed * thruster_speed_modifier, acceleration * acceleration_modifier * delta)

func impulse(dir: Vector3, thrust: float):
	if ship:
		ship.velocity += dir * thrust
