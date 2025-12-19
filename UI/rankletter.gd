extends Node2D
@export var letter:int=6
@export var letarr:Array[Node2D]
@onready var main=$default
@export var movespeed=1
@export var speed=10
@export var timer=0.5
@export var power=0.5

@export var scalel=0.5
@export var noise: FastNoiseLite
@export var grad: Gradient
var times
func _ready() -> void:
	times=0
	for i in range(10):
		main.points[i]=(letarr[letter].points[i]+letarr[letter].position)*scalel
func _process(delta: float) -> void:
	#timer-=delta
	times+=delta
	if timer<=0:
		timer=0.5
		letter+=1
	if Input.is_action_just_pressed("ui_left"):
		letter-=1
	if Input.is_action_just_pressed("ui_right"):
		letter+=1
	letter=letter%7
	for i in range(10):
		main.points[i]=lerp(main.points[i],(letarr[letter].points[i]+letarr[letter].position)*scalel,movespeed*delta)
	for i in range(main.points.size()):
			var noisev=noise.get_noise_2d((main.points[i]+Vector2(times*speed,-0.5*times*speed)).x,(main.points[i]+Vector2(times*speed,-0.5*times*speed)).y)
			noisev=grad.sample(noisev+0.5).r-0.5
			print(noisev)
			main.points[i]+=Vector2(noisev*power,-noisev*power)
