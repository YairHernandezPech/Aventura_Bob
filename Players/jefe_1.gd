extends CharacterBody2D

@onready var move_timer := $walkTimer   # temporizador para caminar
@onready var attack_timer := $AttackTimer  # temporizador para ataque
@onready var anijef := $AnimationPlayer
@onready var collision_shape = $CollisionShape2D
@onready var area_2D = $Area2D

var is_moving = false
var speed = 20

func _ready():
	add_to_group("enemigo")
	
	# Configurar temporizadores de caminar
	move_timer.wait_time = 0
	move_timer.start()
	
	# Temporizador de ataque cada 5 segundos
	attack_timer.wait_time = 5  
	attack_timer.start()
	
	# Conectar las señales de timeout
	move_timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	attack_timer.connect("timeout", Callable(self, "_on_Attack_Timer_timeout"))

func _on_Timer_timeout():
	is_moving = true
	anijef.play("walk")
	collision_shape.disabled = false #Hacer visible
	area_2D.disable_mode = true #Hacer invisible

func _on_Attack_Timer_timeout():
	anijef.play("atack")
	collision_shape.disabled = false #Hacer visible
	area_2D.disable_mode = false #Hacer visible

func _physics_process(delta):
	if is_moving:
		velocity.x = -speed
		move_and_slide()
