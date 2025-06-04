extends Control

func _on_button_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_button_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Interface/interface.tscn")
