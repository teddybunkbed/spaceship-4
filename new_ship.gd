class_name Ship extends CharacterBody3D

@export var model: Node3D
@export var controller: ShipController
@export var flight_component: FlightComponent
@export var state_machine: StateMachine

var _facing_yaw: float

func _ready() -> void:
	_facing_yaw = model.rotation.y

func _physics_process(delta: float) -> void:
	controller.update()
	state_machine.update(delta)
	move_and_slide()

func set_facing_yaw(yaw: float):
	_facing_yaw = yaw
	model.rotation.y = _facing_yaw

func get_facing_yaw() -> float:
	return _facing_yaw

func get_facing_dir() -> Vector3:
	return Vector3(sin(_facing_yaw), 0.0, cos(_facing_yaw))
