extends Node3D

@export var object_scene: PackedScene
@export var spawn_interval: float = 1.0
@export var SpawnPoint : Marker3D

var trash = preload("res://trash.tscn")



func _ready():
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_on_spawn_timeout)
	add_child(timer)

func _on_spawn_timeout():
	var obj = object_scene.instantiate()
	obj.position = SpawnPoint.position
	add_child(obj)
