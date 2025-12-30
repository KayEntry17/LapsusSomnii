extends Camera3D
@export var refheight: Node3D
@export var ogcam:Node3D
func _process(delta: float) -> void:
	self.global_position=Vector3(ogcam.global_position.x,-1*(ogcam.global_position.y-refheight.global_position.y),ogcam.global_position.z)
	self.global_rotation=Vector3(-ogcam.global_rotation.x,ogcam.global_rotation.y,ogcam.global_rotation.z)
