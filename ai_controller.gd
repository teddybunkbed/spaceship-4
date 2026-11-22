class_name AIController extends ShipController

@export var ship: Ship
@export var player: Ship
@export var firing_range: float = 30.0
@export var retreat_range: float = 15.0

func update():
	if player:
		var to_player: Vector3 = player.position - ship.position
		to_player.y = 0.0
		
		if (to_player.length() > firing_range):
			thrust = 1.0
			move_dir = to_player.normalized()
			aim_dir = Vector3.ZERO
			trigger = false
			boost = false
		elif (to_player.length() <= firing_range && to_player.length() > retreat_range):
			thrust = 1
			aim_dir = to_player.normalized()
			move_dir = Vector3(to_player.normalized().z, 0.0, -to_player.normalized().x)
			if (ship.model.basis.z.angle_to(to_player) < deg_to_rad(5.0)):
				trigger = true
			boost = false
		elif (to_player.length() <= retreat_range):
			thrust = 1
			aim_dir = Vector3.ZERO
			move_dir = -to_player.normalized()
			trigger = false
			
			if (ship.model.basis.z.angle_to(-to_player.normalized()) < deg_to_rad(15.0)):
				boost = true
			else:
				boost = false
