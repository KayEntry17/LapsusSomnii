extends Camera3D
@export var speed:float
@export var c: Node3D
func _process(delta: float) -> void:
	self.global_rotation=lerp(global_rotation,c.global_rotation,speed*delta)
	self.global_position=lerp(global_position,c.global_position,speed*5*delta)
