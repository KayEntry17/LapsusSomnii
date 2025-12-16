@tool

extends Node2D
@export var radius=45.1
@export var speed=1.5
@export var gap=0.1
@export var offset=0.0
@export var thickness=1.5
var times=0
var timetr=0
func _process(delta: float) -> void:
	
	timetr+=delta
	times=timetr+offset
	
	queue_redraw()
func _draw():
	var white : Color = Color.WHITE
	var godot_blue : Color = Color("478cbf")
	var grey : Color = Color("414042")

	# Four circles for the 2 eyes: 2 white, 2 grey.
	#draw_circle(Vector2(0, 0), 40, white)
	draw_arc(Vector2(0,0),radius,0+speed*times,2*PI-gap+speed*times,30,white,thickness,false)
