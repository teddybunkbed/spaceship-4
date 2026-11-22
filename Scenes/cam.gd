extends Camera3D

@export var player: Ship
@export var speed: float = 10.0

func _physics_process(delta: float) -> void:
	if player:
		position = position.lerp(Vector3(player.position.x, position.y, player.position.z), speed * delta)
