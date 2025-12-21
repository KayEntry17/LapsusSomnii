extends Node2D
@export var floating: Array[Node2D]
var times=0
@export var speed=10
@export var noise: FastNoiseLite
@export var grad: Gradient
@export var power=0.5

func  _process(delta: float) -> void:
	for j in floating:
		for i in range(j.points.size()):
			var noisev=noise.get_noise_2d((j.points[i]+Vector2(times*speed,-0.5*times*speed)).x,(j.points[i]+Vector2(times*speed,-0.5*times*speed)).y)
			noisev=grad.sample(noisev+0.5).r-0.5
			j.points[i]+=Vector2(noisev*power,-noisev*power)
