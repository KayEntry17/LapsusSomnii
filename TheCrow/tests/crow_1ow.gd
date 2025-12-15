extends Node3D
#region plan
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
#endregion 
#region Parameter Variables
@export_group("Speed")
@export var minspeed:float
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
#endregion
#region corevariables
var spinouttimer : float=0
var flaptimer: float=0
var barrelrolltimer: float=0
var flapcooldownr: float=0
var controltotal:Vector4
var speedtotal:float
var coordinatestr:Vector3
var move_dir: Vector2
enum states {Idle, Normal,Brake_Full, Brake_Left, Brake_Right,Barrel_Roll,Lean_Left, Lean_Right}
var speedadded:float
var speedn:float
@export_group("Main")
@export var state:states
@export var maxangle:float
@export var visual_coll:Node3D
@export var trailf:PathFollow3D
@export var maxcoords: Vector2=Vector2(18,13)
@export var vismode: int=0
@export var viewspeed:float
@export var modelscene:Node3D
#@export var viewpt: Camera3D
#endregion
func _ready() -> void:
	coordinatestr=Vector3(0,0,0)
	speedn=startspeed
	
func _process(delta: float) -> void:
	canflap=true
	if state==states.Normal:
		speedn-=normaldesc*delta
	#speedtotal=30
	controltotal=Vector4(1,1,1,1)
	#print(speedn)
	if canflap and flapcooldownr<=0 and Input.is_action_just_pressed("ui_accept"):
		flap()
	
	
	#region final adjusment and action
	if state==states.Normal:
		speedn=min(speedn,maxbasespeed)
	speedn=max(speedn,minspeed)
	#print(speedn)
	speedtotal=speedadded+speedn
	move_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if move_dir.x<0:
		move_dir.x*=controltotal.x
	else:
		move_dir.x*=controltotal.y
	if move_dir.y<0:
		move_dir.y*=controltotal.w
	else:
		move_dir.y*=controltotal.z
	var crotation=Vector3(maxangle*move_dir.y,-maxangle*move_dir.x,0)
	visual_coll.rotation_degrees=crotation
	#crotation=Vector3(crotation.x/1.5,crotation.y/1.5,0)
		#visual_coll.rotation.x=lerp_angle(visual_coll.global_rotation.y,deg_to_rad(crotation.y),viewspeed*delta)
#
	#visual_coll.rotation.y=lerp_angle(visual_coll.global_rotation.x,deg_to_rad(crotation.x),viewspeed*delta)
	
	#visual_coll.position+=Vector3(speedtotal,0,0).rotated(Vector3.UP, crotation.y)*delta
	#visual_coll.position+=Vector3(speedtotal,0,0).rotated(Vector3.RIGHT, crotation.z)*delta
	coordinatestr+=visual_coll.transform.basis.z*speedtotal*delta
	coordinatestr.x=max(coordinatestr.x,-maxcoords.x)
	coordinatestr.x=min(coordinatestr.x,maxcoords.x)
	coordinatestr.y=max(coordinatestr.y,-maxcoords.y+4)
	coordinatestr.y=min(coordinatestr.y,maxcoords.y-6)
	visual_coll.position.y=-coordinatestr.y
	visual_coll.position.x=-coordinatestr.x
	trailf.progress=coordinatestr.z
	#print(visual_coll.global_rotation_degrees)
	#endregion
	#region vismodes
	
	if vismode==2:
		$TextureRect.visible=true
		$SubViewport.render_target_update_mode=4
		
	else:
		$"TextureRect".visible=false
		$SubViewport.render_target_update_mode=1
	#endregion
	#print(flapcooldownr)

	#region timers count down
	spinouttimer=max(0,spinouttimer-delta)
	flapcooldownr=max(0,flapcooldownr-delta)
	barrelrolltimer=max(0,barrelrolltimer-delta)
		#flapcooldown=max(0,flapcooldown-delta)
		
	#endregion
	if trailf.progress_ratio>=0.1:
		endlevel()
		
func flap():
	flapcooldownr=flapcooldown
	$AnimationPlayer.play("flap")
	modelscene.play("flap")
func flapboost():
	speedn+=speedperflap

func endlevel():
	get_tree().reload_current_scene()
