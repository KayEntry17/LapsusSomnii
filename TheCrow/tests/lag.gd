extends Node3D
@export var speed:float
@export var c: Node3D
func _process(delta: float) -> void:
	self.global_rotation.x=lerp_angle(global_rotation.x,c.global_rotation.x,speed*delta)
	self.global_rotation.y=lerp_angle(global_rotation.y,c.global_rotation.y,speed*delta)
	self.global_position=lerp(global_position,c.global_position,speed*15*delta)
	#self.global_transform=c.global_transform
	
