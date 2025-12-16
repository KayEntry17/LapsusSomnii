extends Label
@export var speed=0.2

func _process(delta: float) -> void:
	rotation+=speed*delta
