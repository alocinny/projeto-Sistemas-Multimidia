extends Node2D
class_name Level

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Olá! Eu sou a Arara-azul-grande.",
		"title": "Arara-azul"
	},

	1: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Moro na Amazônia uma floresta tropical vasta, úmida e cheia de vida!",
		"title": "Arara-azul"
	},

	2: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Esse bioma é lar de uma biodiversidade incrível...",
		"title": "Arara-azul"
	},

	3: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "...e de muitos rios que cortam as matas verdes.",
		"title": "Arara-azul"
	},

	4: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Mas tudo isso está ameaçado pelo desmatamento.",
		"title": "Arara-azul"
	},

	5: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Eu, por exemplo, dependo de palmeiras específicas para sobreviver.",
		"title": "Arara-azul"
	},

	6: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Elas são onde faço ninhos e encontro alimento.",
		"title": "Arara-azul"
	},

	7: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Sua missão é ajudar a restaurar este ecossistema!",
		"title": "Arara-azul"
	},

	8: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Vamos começar pela Missão 1:",
		"title": "Arara-azul"
	},

	9: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Crie uma 'Cobertura Arbórea Densa' com pelo menos X peças de Floresta Densa conectadas.",
		"title": "Arara-azul"
	},

	10: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Missão 2: Forme uma 'Rede Hídrica Vital' com pelo menos Y segmentos de Peça de Rio conectados.",
		"title": "Arara-azul"
	},

	11: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Missão 3: Coloque Z peças de Palmeiral ao lado de áreas de Floresta Densa.",
		"title": "Arara-azul"
	},

	12: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Quando terminar, volte aqui. Boa sorte, guardião da floresta!",
		"title": "Arara-azul"
	}
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
