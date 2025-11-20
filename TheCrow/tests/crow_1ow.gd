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
