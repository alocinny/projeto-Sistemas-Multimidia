extends Control


func _on_start_pressed() -> void:
	print("Start pressed") #colocar a cena do jogo quando fizer
	get_tree().change_scene_to_file("res://scenes/lvl_select/caatinga.tscn")


func _on_options_pressed() -> void:
	print("Options pressed")


func _on_quit_pressed() -> void:
	get_tree().quit()
