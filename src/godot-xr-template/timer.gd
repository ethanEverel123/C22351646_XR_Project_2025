extends Node3D

@export var spawn_points: Array[Node3D]
@export var object_scene: PackedScene
@export var spawn_interval := 1.5
var trash = preload("res://trash.tscn")

func _ready():
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_spawn_object)
	add_child(timer)
	
	
func _on_timer_timeout():
	print_debug("spawned trash")
	_spawn_object(Vector3(1,5,0))
	
func _spawn_object(pos):
	var obj = trash.instantiate()
	obj.position = pos
	add_child(obj)
