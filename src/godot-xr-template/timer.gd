extends Timer	

@export var spawn_points: Array[Node3D]
@export var object_scene: PackedScene
@export var spawn_interval := 1.5

func _ready():
	var timer := Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.timeout.connect(_spawn_object)
	add_child(timer)

func _spawn_object():
	var obj = object_scene.instantiate()
	var point = spawn_points.pick_random()
	obj.position = point.position
	add_child(obj)
