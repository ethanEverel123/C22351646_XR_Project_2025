extends Node3D

@export var trash: PackedScene
@export var fish: PackedScene
@export var spawn_interval: float = 1.0
@export var SpawnPoint: Marker3D
var rng = RandomNumberGenerator.new()

func _ready():
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_on_spawn_timeout)
	add_child(timer)


func _on_spawn_timeout():
	var my_random_number = rng.randf_range(0.0, 10.0)
	if my_random_number > 3:
		var obj = trash.instantiate()
		obj.global_transform = SpawnPoint.global_transform
		get_tree().current_scene.add_child(obj)
		obj.add_to_group("trash")
	else:
		var obj = fish.instantiate()
		obj.global_transform = SpawnPoint.global_transform
		get_tree().current_scene.add_child(obj)
		obj.add_to_group("fish")

		
