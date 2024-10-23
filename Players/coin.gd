extends Area2D

signal coin_collected
@onready var audio := $"../AudioStreamPlayer"
func _ready():
		add_to_group("coins")#esto es para crear un grupo
		
func _on_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("coin_collected")
		queue_free()
		audio.playing = true
		pass
