@tool
extends XRToolsPickable

@export var lifetime := 5.0

func _ready():
	if Engine.is_editor_hint():
		return

	await get_tree().process_frame
	await get_tree().create_timer(lifetime).timeout

	if is_inside_tree():
		queue_free()
