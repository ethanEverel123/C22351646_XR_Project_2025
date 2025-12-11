extends Node3D

func _ready():
	$DeleteArea.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	
	#delete trash if it enters the can
	if body.is_in_group("trash"):
		body.queue_free()
