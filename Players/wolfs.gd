extends CharacterBody2D

@onready var aniWolf := $AnimationPlayer
@onready var sprite := $Sprite2D
@onready var move_timer := $Timer
var is_moving = false
var speed = 100

func _ready():
	move_timer.wait_time = 0
	move_timer.start() 
	add_to_group("enemigo")#esto es para crear un grupo
	
	move_timer.connect("timeout", Callable(self, "_on_Timer_timeout"))


func _on_Timer_timeout():
	is_moving = true
	aniWolf.play("Walk") 

func _physics_process(delta):
	if is_moving:
		velocity.x = -speed
		move_and_slide()
