extends Area2D

func _ready():
		add_to_group("portal")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("tocando el portal")
		body.queue_free()
		get_tree().change_scene_to_file("res://Players/mundo_2.tscn")
	pass

#Si se quiere agregar para que el player solo puede pasar al siguiente nivel si recoje todas las monedas
#func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#print("tocando el portal")
		#if Global.coins == 18|| Global.coins == 36 :
			#body.queue_free()
			#get_tree().change_scene_to_file("res://Players/mundo_2.tscn")
	#pass
