extends Node3D

@export var explosion_scene: PackedScene
@export var bad_scene: PackedScene


func _ready():
	$DeleteArea.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	
	#delete trash if it enters the can
	if body.is_in_group("trash"):
		var explosion:GPUParticles3D = explosion_scene.instantiate()
		get_parent().add_child(explosion)	
		explosion.global_position = global_position
		explosion.emitting = true
		
		body.queue_free()
	if body.is_in_group("fish"):
		var bad:GPUParticles3D = bad_scene.instantiate()
		get_parent().add_child(bad)	
		bad.global_position = global_position
		bad.emitting = true
		
		body.queue_free()
