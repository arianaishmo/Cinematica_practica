extends Node

var fr 
var ang 
var masa
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	ang = 0
	fr = 0.01
	masa = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("friction_mas"):
		fr += 0.01
	elif Input.is_action_pressed("friction_menos"):
		fr -= 0.01
		
	if Input.is_action_pressed("angulo_mas"):
		ang -= 2
	elif Input.is_action_pressed("angulo_menos"):
		ang += 2
		
	if Input.is_action_pressed("masa_mas"):
		masa += 1
	elif Input.is_action_pressed("masa_menos"):
		masa += -1
		
	if masa <= 0:
		masa = 0.1
		
	if ang < -25:
		ang = -25
	elif ang > 0:
		ang = 0
		
	if fr > 1:
		fr = 1
	elif fr < 0:
		fr = 0
		
	
