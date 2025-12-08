@tool
extends MeshInstance3D
func _process(delta: float) -> void:
	rotation_degrees.y+=10*delta
	#print(0)
