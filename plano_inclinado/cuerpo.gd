extends KinematicBody2D

var velocity = Vector2()
var gravity = 98
var up_direction = Vector2(0, -1)
var masa
var N
var Fr = Vector2()
var W = Vector2()
var an
var an_ini

func _ready():
	an_ini = Globales.ang
	masa = Globales.masa
	W.y = masa * gravity * cos(deg2rad(Globales.ang))
	W.x = masa * gravity * sin(deg2rad(Globales.ang))
	N = -W.y
	Fr = Globales.fr * N
	an = 0

func _physics_process(delta):
	if an_ini != Globales.ang:
		queue_free()
		
	velocity = move_and_slide(velocity, up_direction)
	
	if is_on_floor() == true:
		if an == 0:
			$Sprite.rotate(deg2rad(Globales.ang))
			an = 1
		velocity.y += sin(deg2rad(Globales.ang)) * ((W.x - Fr) / masa) * delta * delta * 0.5
		velocity.x -= cos(deg2rad(Globales.ang)) * ((W.x - Fr) / masa) * delta * delta * 0.5
		if velocity.x > 0:
			velocity.x = 0
			
		#print("entre")
	else:
		velocity.y += gravity * delta
	
