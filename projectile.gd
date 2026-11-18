extends Area3D

@export var speed: float = 100.0
@export var lifespan: float = 5.0
@export var damage: int = 1

@onready var life_timer: Timer = $Timer

func _ready() -> void:
	life_timer.wait_time = lifespan
	life_timer.connect("timeout", timeout)
	life_timer.start()

func _physics_process(delta: float) -> void:
	position += basis.z * speed * delta

func timeout():
	queue_free()



func _on_body_entered(body: Node3D) -> void:
	body.health -= damage
	queue_free()
