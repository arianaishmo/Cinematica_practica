extends Node2D


onready var tile_map = get_node("TileMap2")

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map.set_collision_friction(Globales.fr)
	tile_map.rotate(deg2rad(Globales.ang))
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		
	if Input.is_action_just_pressed("ui_up"):
		tile_map.rotation_degrees = Globales.ang
	
func shoot():
	var proyectil = load("res://cuerpo.tscn")
	var bullet = proyectil.instance()
	print($Position2D.position)
	bullet.position = $Position2D.position
	print(bullet.position)
	get_parent().add_child(bullet)
