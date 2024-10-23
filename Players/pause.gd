extends CanvasLayer

# Función ready se ejecuta cuando el nodo está listo
func _ready():
	# El Label y el ColorRect estarán ocultos inicialmente
	$Label.visible = false
	$ColorRect.visible = false

func _physics_process(delta):
	if Input.is_action_just_pressed("pausa"):
		# Cambiamos el estado de pausa del juego
		get_tree().paused = not get_tree().paused

		# Si el juego está pausado, mostramos el Label y el ColorRect
		if get_tree().paused:
			$Label.visible = true
			$ColorRect.visible = true
		# Si no está pausado, los ocultamos
		else:
			$Label.visible = false
			$ColorRect.visible = false
