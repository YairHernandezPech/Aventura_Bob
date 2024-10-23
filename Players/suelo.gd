extends StaticBody2D

func _ready():
	var shape = $CollisionShape2D.shape
	if shape is RectangleShape2D:
		shape.extents.x = 100000  # Hace que el ancho del colisionador sea muy grande.
		shape.extents.y = 10  # Ajusta la altura si es necesario.
