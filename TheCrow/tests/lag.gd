extends Camera3D
@export var speed:float
@export var c: Node3D
func _process(delta: float) -> void:
	self.global_rotation=lerp(global_rotation,c.global_rotation,speed*delta)
	
