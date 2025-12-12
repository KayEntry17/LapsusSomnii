extends Node3D
@export var speed:float
@export var c: Node3D
func _process(delta: float) -> void:
	#self.global_rotation=lerp(global_rotation,c.global_rotation,speed*delta)
	self.global_position=c.global_position
	self.global_rotation.x=lerp_angle(global_rotation.x,c.global_rotation.x,speed*delta)
	self.global_rotation.z=lerp_angle(global_rotation.z,c.global_rotation.z,speed*delta)
	self.global_rotation.y=lerp_angle(global_rotation.y,c.global_rotation.y,speed*delta)

	#if rotation_degrees.x-c.rotation_degrees.x>180:
		#self.global_rotation.x=lerp(global_rotation.x-360,c.global_rotation.x,speed*delta)
	#else:
		#if rotation_degrees.x-c.rotation_degrees.x<-180:
			#self.global_rotation.x=lerp(global_rotation.x+360,c.global_rotation.x,speed*delta)
		#else:
			#self.global_rotation.x=lerp(global_rotation.x,c.global_rotation.x,speed*delta)
	#if rotation_degrees.y-c.rotation_degrees.y>180:
		#self.global_rotation.y=lerp(global_rotation.y-360,c.global_rotation.y,speed*delta)
	#else:
		#if rotation_degrees.y-c.rotation_degrees.y<-180:
			#self.global_rotation.y=lerp(global_rotation.y+360,c.global_rotation.y,speed*delta)
		#else:
			#self.global_rotation.y=lerp(global_rotation.y,c.global_rotation.y,speed*delta)
	
	print(global_rotation_degrees)
	print(c.global_rotation_degrees)
