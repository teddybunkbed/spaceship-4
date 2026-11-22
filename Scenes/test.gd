extends Node3D

@export var player: Ship
@export var ai_ship: Ship

func _ready() -> void:
	ai_ship.controller.player = player
