extends Node2D
@export var on=true
@export var listradbase:Array[Node]
var listradon:Array[float]
@export var listradshader:Array[Node]
@export var speed=5
@export var portrait: Texture2D
var listradonshader:Array[float]
func _ready() -> void:
	$Node2D/Crowptproto.texture=portrait
	for i in listradbase:
		listradon.append(i.radius)
		if !on:
			i.radius=0
	for i in listradshader:
		listradonshader.append(i.material.get_shader_parameter("radius"))
		if !on:
			i.material.set_shader_parameter("radius",0.0)
func _process(delta: float) -> void:
	if on:
		for i in range(listradbase.size()):
			listradbase[i].radius=lerp(listradbase[i].radius,listradon[i],speed*delta)
		
		for i in range(listradshader.size()):
			listradshader[i].material.set_shader_parameter("radius",lerp(listradshader[i].material.get_shader_parameter("radius"),listradonshader[i],speed*delta))
	else:
		for i in range(listradbase.size()):
			listradbase[i].radius=lerp(listradbase[i].radius,0.0,speed*delta)
		
		for i in range(listradshader.size()):
			listradshader[i].material.set_shader_parameter("radius",lerp(listradshader[i].material.get_shader_parameter("radius"),0.0,speed*delta))
	if Input.is_action_just_pressed("ui_down"):
		on=!on
		
