extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/lvl_select/mata_atlantica.tscn")


func _on_button_pressed() -> void:
		get_tree().change_scene_to_file("res://scenes/lvl_select/pampa.tscn")


func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tela_jogo/amazonia.tscn")
