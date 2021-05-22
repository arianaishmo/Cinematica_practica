extends Node2D

#	Llamando al nodo TileMap para poder manejarlo
onready var tile_map = get_node("TileMap2")

# Called when the node enters the scene tree for the first time.
func _ready():
	#	Se inicializa el coeficiente de fricción del suelo, así como 
	#	los grados de inclinación
	tile_map.set_collision_friction(Globales.fr)
	tile_map.rotate(deg2rad(Globales.ang))
	
func _process(delta):
	#	Al dar Enter o espacio se instancía un cuerpo
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
	
	#	Al dar la tecla arriba se actualizan los grados de inclinación del plano
	if Input.is_action_just_pressed("ui_up"):
		tile_map.rotation_degrees = Globales.ang
	
#	Función que instancía un cuerpo mandando llamar a la escena cuerpo.tscn 
#	y colocándolo donde se encuentre el nodo Position2D, puesto especialmente para esto.
func shoot():
	var proyectil = load("res://cuerpo.tscn")
	var bullet = proyectil.instance()
	print($Position2D.position)
	bullet.position = $Position2D.position
	print(bullet.position)
	get_parent().add_child(bullet)
