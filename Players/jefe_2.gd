extends CharacterBody2D

@onready var attack_timer := $AttackTimer # temporizador para ataque
@onready var anijef := $AnimationPlayer
@onready var collision_shape = $CollisionShape2D
@onready var poder = $poder


var is_moving = false
var speed = 20

func _ready():
	add_to_group("enemigo")
	
	# Temporizador de ataque cada 5 segundos
	attack_timer.wait_time = 1 
	attack_timer.start()
	
	# Conectar las señales de timeout
	attack_timer.connect("timeout", Callable(self, "_on_Attack_Timer_timeout"))
	
func _on_Attack_Timer_timeout():
	anijef.play("atack")
	collision_shape.disabled = true
	poder.disabled = true
	await get_tree().create_timer(0.55).timeout
	poder.disabled = false
	await get_tree().create_timer(0.20).timeout  # 0.75 - 0.55 = 0.20



func _physics_process(delta):
	if is_moving:
		velocity.x = -speed
		move_and_slide()
