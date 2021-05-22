extends Node

#	Variables
#	fr = coeficiente de fricción
#	ang = grados de inclinación del plano
#	masa = masa del objeto
var fr 
var ang 
var masa

#	Se inicializan las variables en la primera vuelta del loop principal
func _ready():
	ang = 0
	fr = 0.01
	masa = 1



func _process(delta):
	#	Con las teclas G y F se aumenta o decrementa la fricción respectivamente
	if Input.is_action_pressed("friction_mas"):
		fr += 0.01
	elif Input.is_action_pressed("friction_menos"):
		fr -= 0.01
		
	#	Con las teclas + y - se aumenta o decrementa el ángulo del plano respectivamente
	if Input.is_action_pressed("angulo_mas"):
		ang -= 2
	elif Input.is_action_pressed("angulo_menos"):
		ang += 2
		
	#	Con las teclas M y N se aumenta o decrementa la masa respectivamente
	if Input.is_action_pressed("masa_mas"):
		masa += 1
	elif Input.is_action_pressed("masa_menos"):
		masa += -1
		
		
	#	Lo mínimo que puede valer la masa
	if masa <= 0:
		masa = 0.1
		
	#	Lo máximo y mínimo que puede llegar a ser el ángulo de inclinación
	if ang < -25:
		ang = -25
	elif ang > 0:
		ang = 0
		
	#	Lo máximo y mínimo que puede llegar a valer el coeficiente de fricción
	if fr > 1:
		fr = 1
	elif fr < 0:
		fr = 0
		
	
