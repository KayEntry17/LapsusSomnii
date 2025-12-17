@tool
extends Node2D
@export var radius=40.0
var thickness=0.0
@export var col:Color
func _process(delta: float) -> void:
	queue_redraw()
func _draw():
	var white : Color = Color.WHITE
	var godot_blue : Color = Color("478cbf")
	var grey : Color = Color("414042")

	# Four circles for the 2 eyes: 2 white, 2 grey.
	draw_circle(Vector2(0, 0), radius, col)
	#draw_arc(Vector2(0,0),45,0,6,30,white,1,true)
