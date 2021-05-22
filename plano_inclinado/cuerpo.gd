extends KinematicBody2D


#	Declaración de variables
var pos = Vector2()
var gravity = 98
var up_direction = Vector2(0, -1)
var masa
var N	#	Variable donde se almacenrá la fuerza normal
var Fr = Vector2()	#	Variable donde se almacenará la fuerza de fricción
var W = Vector2()	#	Variable donde se almacenará el peso
var an	#	Variable booleana que se usará como bandera
var an_ini	#	Inicialización de ángulo de rotación del plano según se mande llamar la escena

func _ready():
	#	Se inicializan las variables según el valor de las variables globales de ángulo y masa
	an_ini = Globales.ang
	masa = Globales.masa
	
	#	Se calcula el peso, la fuerza normal, la fuerza de fricción 
	W.y = masa * gravity * cos(deg2rad(Globales.ang))
	W.x = masa * gravity * sin(deg2rad(Globales.ang))
	N = -W.y
	Fr = Globales.fr * N
	an = 0

func _physics_process(delta):
	#	De ser diferente el ángulo inicial al que se encuentra ahora en las variables globales,
	#	se libera la memoria
	if an_ini != Globales.ang:
		queue_free()
		
	#	Función necesaria para mover el objeto en la escena
	pos = move_and_slide(pos, up_direction)
	
	#	Si el objeto toca el suelo, comienza a ejecutarse las fórmulas para el plano inclinado
	if is_on_floor() == true:
		#	Rota el sprite al ángulo del plano
		if an == 0:
			$Sprite.rotate(deg2rad(Globales.ang))
			an = 1
			
		#	Se actualiza la posición calculando la aceleración para x e y, la posición es (a * t^2)/2
		pos.y += sin(deg2rad(Globales.ang)) * ((W.x - Fr) / masa) * delta * delta * 0.5
		pos.x -= cos(deg2rad(Globales.ang)) * ((W.x - Fr) / masa) * delta * delta * 0.5
		
		if pos.x > 0:
			pos.x = 0
			
		#print("entre")
	else:
		#	Si no está el objeto en el piso, está cayendo
		pos.y += gravity * delta
	
