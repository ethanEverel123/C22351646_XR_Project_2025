extends Node3D

@export var trash: PackedScene
@export var fish: PackedScene
@export var spawn_interval: float = 1.0
@export var spawn_point: Marker3D

var rng := RandomNumberGenerator.new()

func _ready():
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_on_spawn_timeout)
	add_child(timer)

func _on_spawn_timeout():
	var obj: Node3D

	if rng.randf() > 0.3:
		obj = trash.instantiate()
		obj.add_to_group("trash")
	else:
		obj = trash.instantiate()
		obj.add_to_group("fish")

	obj.global_transform = spawn_point.global_transform
	get_tree().current_scene.add_child(obj)
