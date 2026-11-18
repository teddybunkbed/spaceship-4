class_name Projectile extends Area3D

@export var speed: float = 100.0
@export var lifetime: float = 5.0

var life_timer: float
var local_velocity: Vector3

func _ready() -> void:
	life_timer = lifetime

func _physics_process(delta: float) -> void:
	if (life_timer <= 0):
		queue_free()
	else:
		life_timer -= delta
		position += (local_velocity + (basis.z * speed)) * delta
