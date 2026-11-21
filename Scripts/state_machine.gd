class_name StateMachine extends Node

@export var default_state: State

var current_state: State

func _ready() -> void:
	if default_state:
		current_state = default_state

func update(delta: float):
	if current_state:
		current_state.update(delta)

func change_state(new_state: State):
	current_state.exit()
	current_state = new_state
	current_state.enter()
