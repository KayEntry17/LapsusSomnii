extends Camera3D
@export var camcopy: Camera3D
func _process(delta: float) -> void:
	self.global_position=camcopy.global_position
	self.global_rotation=camcopy.global_rotation
	#fov=camcopy.fov
