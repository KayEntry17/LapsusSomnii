extends Node3D
@export var birdbirdbird: Node3D
@export var maxangle=Vector2(10,20)
func _process(delta: float) -> void:
	look_at(birdbirdbird.global_position,$"..".basis.y)
	rotation_degrees.x=max(rotation_degrees.x,-maxangle.x)
	rotation_degrees.x=min(rotation_degrees.x,maxangle.x)
	rotation_degrees.y=max(rotation_degrees.y,-maxangle.y)
	rotation_degrees.y=min(rotation_degrees.y,maxangle.y)
	print(rotation_degrees)
