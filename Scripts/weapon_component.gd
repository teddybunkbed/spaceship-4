class_name WeaponComponent extends Node

@export var ship: Ship
@export var cooldown: float = 0.2

var projectile_scene = preload("res://Scenes/projectile.tscn")
var cooldown_timer: float = 0.0

func _physics_process(delta: float) -> void:
	if (cooldown_timer > 0):
		cooldown_timer -= delta
	else:
		if (ship.controller.trigger):
			cooldown_timer = cooldown
			fire_projectile()

func fire_projectile():
	var projectile: Projectile = projectile_scene.instantiate()
	projectile.position = ship.hardpoint.global_position
	projectile.rotation.y = ship.get_facing_yaw()
	projectile.local_velocity = ship.velocity
	get_tree().root.add_child(projectile)
