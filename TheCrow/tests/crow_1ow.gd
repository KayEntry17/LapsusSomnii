extends Node3D

#Basics of controls:
	#reversed up down axis for turning
	#button to flap - speeds up player temporarily
	#Full lean - shrinks hitbox, boost to turning in that direction, lesser movement in the other direction
	#Part lean/brake - light adjustment in a direction along with speed slowing down
	#both sides full lean - barrel roll, boost to speed, slow rotation in all direction while its on
	
	#both sides part - brake, slow down rotation, slower speed
# possibly a free control mode where you use the stick to angle the crow, could be used 4 a neat challenge level
#Points/scoring:
	#Two levels of hitboxes around crow - one gives a small score bonus if it touches the crow, smaller one gives a large one
#	speed of the crow is tracked, times give score advantages
# small gaps and no messing up between approaches adds multiplier to score
# when in full lean, a special hitbox set appears - if both sides of the crow are close to an obstacle, a very large score bonus gets added.
#each one is on a cooldown
#When hurt, the score modifier drops and the crow looses speed in the game world and gets moved back a bit with an animation, 
#(if clunky its possible to just loose speed in an animation and destroy the obstacle)
#in overworld the crow gets sent back a large distance and stops
# barreling towards the ground plays a simple animation while transitioning the camera to an fps view to admire the sights and get dialogue

@export_group("Speed")
@export var speedperflap: float
@export var startspeed: float
@export var knockbackspeed: float
@export var fullleanspeed: float
@export var brakespeed: float
@export var barrelrollspeed: float
@export var maxbasespeed: float
@export_group("Acceleration")
@export var normaldesc: float
@export var fullleandesceleration: float
@export var brakedesc: float
@export var dmgdesc: float
@export_group("Timers")
@export var spinouttime : float
@export var flaptime: float
@export var barrelrolltime: float
@export var flapcooldown: float
var spinouttimer : float=0
var flaptimer: float=0
var barrelrolltimer: float=0
var flapcooldownr: float=0
@export_group("Flags")
@export var canflap: bool
@export var isbrolling: bool
@export var cooldown: bool
@export_group("ControlMod")
@export var Lean: Vector4=Vector4(1,1,1,1)
@export var brake: Vector4=Vector4(1,1,1,1)
@export var fullbrake:Vector2=Vector2(1,1)
@export var broll:Vector2=Vector2(1,1)
@export var damaged: Vector2=Vector2(1,1)
func _process(delta: float) -> void:
	pass
