extends Node

@onready var label = $Label
@onready var timer = $Timer

func _ready() -> void:
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	Global.minute = floor(time_left / 60)
	Global.second = int(time_left) % 60
	return [Global.minute, Global.second]
	
func _process(delta: float) -> void:
	label.text = "%02d:%02d" % time_left_to_live()
	player_die()
	
	
func player_die():
	if Global.second == 0 and Global.minute == 0 :
		$GameOver.text = str("Time out")
		$TimerFunc.wait_time = 1
		$TimerFunc.start()
		await $TimerFunc.timeout  # Esperar a que termine el tiempo del temporizador
		_on_death_animation_finished()

func _on_death_animation_finished():
	if is_inside_tree():
		Global.death_count -= 1 
		if Global.death_count == 0:
			Global.death_count = 3
			get_tree().change_scene_to_file("res://Players/menu.tscn")
		else :
			#get_tree().change_scene_to_file("res://Players/mundo_1.tscn")
			get_tree().reload_current_scene()
