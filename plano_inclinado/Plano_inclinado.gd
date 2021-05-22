extends Node2D


func _process(delta):
	$Label.text = "Coef. Fricción: " + str(Globales.fr)
	$Label2.text = "Ángulo: " + str(Globales.ang)
	$Label3.text = "Masa: " + str(Globales.masa)
