extends Node2D
class_name Level_ararinha

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Olá! Eu sou a Arara-azul-grande.",
		"title": "Arara-azul"
	},

	1: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Você sabia que esta vasta floresta é um dos maiores pulmões do mundo?",
		"title": "Arara-azul"
	},

	2: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Ela absorve bilhões de toneladas de carbono da atmosfera, um serviço climático vital!",
		"title": "Arara-azul"
	},

	3: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Mas o desmatamento e as queimadas têm liberado esse carbono de volta, ",
		"title": "Arara-azul"
	},

	4: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": " intensificando as mudanças climáticas.",
		"title": "Arara-azul"
	},

	5: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Ao conectar estas peças de Floresta Densa e criar rios vitais",
		"title": "Arara-azul"
	},

	6: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": ", você não só ajuda as espécies nativas como eu, mas também combate diretamente o aquecimento global!",
		"title": "Arara-azul"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	_hud.add_child(_new_dialog)
