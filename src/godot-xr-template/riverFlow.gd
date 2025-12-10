extends Area3D

@export var flow_direction: Vector3 = Vector3(1, 0, 0)   # right
@export var flow_strength: float = 100.0

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body is RigidBody3D:
			body.apply_force(flow_direction * flow_strength)
