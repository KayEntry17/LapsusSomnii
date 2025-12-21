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
var curline:String
@export var speed=10
@export var textdissp=1.0
@export var lettersp=50
var textcurchanged=0
@export var tblist:Dictionary[int, Node2D]
var inip1=Vector2(57,303)
var inip2=Vector2(583,303)
func _ready() -> void:
	change_line("introhs")
func reallign_text():
	$bg/lmain.position=tblist[speaking].get_child(0).position
	$bg/lmain.rotation=tblist[speaking].get_child(0).rotation
	$bg/lmain.size=tblist[speaking].get_child(0).size
	$bg/llabel.position=tblist[speaking].get_child(1).position
	$bg/llabel.rotation=tblist[speaking].get_child(1).rotation
	$bg/llabel.horizontal_alignment=tblist[speaking].get_child(1).horizontal_alignment
func _process(delta: float) -> void:
	#print($bg/llabel.visible_ratio)
	#region animations
	
	times+=delta
	
	if speaking<0:
		$"../portrait".on=true
		$"../portrait2".on=false
		targetp1=inip1
		targetp2=Vector2(inip2.x+offset,inip2.y)
		
	elif speaking>0:
		$"../portrait2".on=true
		$"../portrait".on=false
		targetp2=inip2
		targetp1=Vector2(inip1.x-offset,inip2.y)
		
	elif speaking==0:
		$"../portrait2".on=false
		$"../portrait".on=false
		
	
	for i in range($Line2Dtr.points.size()):
			$Line2Dtr.points[i]=lerp($Line2Dtr.points[i],tblist[speaking].points[i],movespeed*delta)
			var noisev=noise.get_noise_2d(($Line2Dtr.points[i]+Vector2(times*speed,-0.5*times*speed)).x,($Line2Dtr.points[i]+Vector2(times*speed,-0.5*times*speed)).y)
			noisev=grad.sample(noisev+0.5).r-0.5
			$Line2Dtr.points[i]+=Vector2(noisev*power,-noisev*power)
			#print(noisev)
	#$"../portrait".position=lerp($"../portrait".position, targetp1,movespeed*delta)
	#$"../portrait2".position=lerp($"../portrait2".position, targetp2,movespeed*delta)
	
	#queue_redraw()
	#endregion
	if textcurchanged==1 and $bg/lmain.visible_ratio<1:
		$bg/lmain.visible_ratio+=delta*lettersp/$bg/lmain.text.length()
	if Input.is_action_just_pressed("ui_accept") and speaking!=0:
		if $bg/lmain.visible_ratio<1:
			$bg/lmain.visible_ratio=1
		else:
			change_line(Dialogue.nextline[curline])
	if Input.is_action_just_pressed("ui_right"):
		speaking-=1
	if Input.is_action_just_pressed("ui_left"):
		speaking+=1
func change_line(line):
	textcurchanged=0
	if $bg/llabel.text!=Dialogue.imgnames[Dialogue.dicsprdial[line]] or speaking!=Dialogue.dialoguetbmode[line]:
		var tween2 = get_tree().create_tween()
		tween2.tween_property($bg/llabel, "visible_ratio", 0,textdissp)
		#print("iusaghduhassduih")
	speaking=Dialogue.dialoguetbmode[line]
	curline=line
	$Timer.start(0.25)
	var tween = get_tree().create_tween()
	tween.tween_property($bg/lmain, "visible_ratio", 0,textdissp)

	if speaking<0:
		$"../portrait".portrait=Dialogue.dicimg[Dialogue.dicsprdial[curline]]
		$"../portrait".upd8portrait()
	if speaking>0:
		$"../portrait2".portrait=Dialogue.dicimg[Dialogue.dicsprdial[curline]]
		$"../portrait2".upd8portrait()
	#tween.tween_callback($Sprite.queue_free)
#func _draw():
	#var polygons = Geometry2D.merge_polygons($Line2D3.points, PackedVector2Array([]))
	#for i in polygons:
		#draw_colored_polygon(i,Color.BLACK)


func _on_timer_timeout() -> void:
	reallign_text()
	
	$bg/lmain.text=Dialogue.dicttext[curline]
	$bg/llabel.text=Dialogue.imgnames[Dialogue.dicsprdial[curline]]
	
	textcurchanged=1
	
	if $bg/llabel.visible_ratio!=1:
		#print("kys")
		var tween3 = get_tree().create_tween()
		tween3.tween_property($bg/llabel, "visible_ratio", 1.0,0.24)
		
