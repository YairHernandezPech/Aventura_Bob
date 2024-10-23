extends CanvasLayer

var death_count = Global.death_count

func _ready():
	# Actualizamos el texto con el contador inicial
	$Label.text = str(death_count)
	
