extends Node2D
@export var speaking=1
var targetp1
var targetp2
@export var movespeed=1
@export var noise: FastNoiseLite
@export var grad: Gradient
@export var offset=200
var times=0
@export var power=1.5
@export var speed=10
var inip1=Vector2(57,303)
var inip2=Vector2(583,303)
func _process(delta: float) -> void:
	times+=delta
	if speaking==1:
		$"../portrait".on=true
		$"../portrait2".on=false
		targetp1=inip1
		targetp2=Vector2(inip2.x+offset,inip2.y)
		for i in range($Line2D3.points.size()):
			$Line2D3.points[i]=lerp($Line2D3.points[i],$Line2D.points[i],movespeed*delta)
	elif speaking==-1:
		$"../portrait2".on=true
		$"../portrait".on=false
		targetp2=inip2
		targetp1=Vector2(inip1.x-offset,inip2.y)
		for i in range($Line2D3.points.size()):
			$Line2D3.points[i]=lerp($Line2D3.points[i],$Line2D2.points[i],movespeed*delta)
	
	for i in range($Line2D3.points.size()):
			var noisev=noise.get_noise_2d(($Line2D3.points[i]+Vector2(times*speed,-0.5*times*speed)).x,($Line2D3.points[i]+Vector2(times*speed,-0.5*times*speed)).y)
			noisev=grad.sample(noisev+0.5).r-0.5
			$Line2D3.points[i]+=Vector2(noisev*power,-noisev*power)
			#print(noisev)
	#$"../portrait".position=lerp($"../portrait".position, targetp1,movespeed*delta)
	#$"../portrait2".position=lerp($"../portrait2".position, targetp2,movespeed*delta)
	
	if Input.is_action_just_pressed("ui_accept"):
		speaking*=-1
	queue_redraw()
func _draw():
	var polygons = Geometry2D.merge_polygons($Line2D3.points, PackedVector2Array([]))
	for i in polygons:
		draw_colored_polygon(i,Color.BLACK)
