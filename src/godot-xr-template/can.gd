extends Node3D

func _ready():
	$DeleteArea.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	print("Trash can detected:", body)  # Debug

	if body.is_in_group("trash"):
		print("Deleting trash:", body)
		body.queue_free()
