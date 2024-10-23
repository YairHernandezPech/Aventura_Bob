extends CharacterBody2D

var speed := 300
var direccion := 0.0
var jump_force := 400
var gravity := 9
var is_jumping = false

@onready var aniPlayer := $AnimationPlayer
@onready var sprite := $Sprite2D
@onready var death_timer := Timer.new()
@onready var audio := $AudioStreamPlayer

func _ready():
	death_timer.one_shot = true 
	death_timer.wait_time = 1.4  #duración de la animación de muerto
	add_child(death_timer)
	add_to_group("player")#esto es para crear un grupo

func _physics_process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed

	# Animaciones de correr y estar quieto
	if not is_jumping:
		if direccion != 0:
			aniPlayer.play("run")
		else:
			aniPlayer.play("idle")

	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h

	# Salto
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up"):
		if is_on_floor(): 
			is_jumping = true
			velocity.y = -jump_force
			aniPlayer.play("jumb")
			audio.playing = true

	# Aplicar gravedad
	velocity.y += gravity 

	move_and_slide()

	if is_on_floor():
		is_jumping = false


func _on_area_2d_body_entered(body):
	if body.is_in_group("enemigo"):
		print("muerto")
		aniPlayer.play("dead")
		$GameOver.text = str("Game over")
		Global.coins = 0
		death_timer.start()
		death_timer.connect("timeout", Callable(self, "_on_death_animation_finished"))
	

# Esta funcion sirve para que cuando mueras las vidas se van restando
func _on_death_animation_finished():
	if is_inside_tree():
		Global.death_count -= 1 
		if Global.death_count == 0:
			Global.death_count = 3
			get_tree().change_scene_to_file("res://Players/menu.tscn")
		else :
			#get_tree().change_scene_to_file("res://Players/mundo_1.tscn")
			get_tree().reload_current_scene()
			
