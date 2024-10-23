extends Control


func _ready():
	$VBoxContainer/StartButton.grab_focus()
	
	
func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Players/mundo_1.tscn")


func _on_quit_button_2_pressed() -> void:
	get_tree().quit()
