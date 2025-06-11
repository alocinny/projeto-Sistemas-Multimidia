extends Node2D
class_name Level_Tuiuiu

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_pantanal: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Olá! Sou o Tuiuiú (Jabiru mycteria), símbolo do Pantanal.",
		"title": "Tuiuiú"
	},
	1: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Dependo de áreas alagadas para alimentação e árvores altas para nidificação.",
		"title": "Tuiuiú"
	},
	2: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "O Pantanal é a maior planície alagável do mundo.",
		"title": "Tuiuiú"
	},
	3: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Tem ciclo de cheias e secas, rica fauna aquática e terrestre.",
		"title": "Tuiuiú"
	},
	4: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "É um mosaico de campos, florestas e áreas alagadas.",
		"title": "Tuiuiú"
	},
	5: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Missões:",
		"title": "Tuiuiú"
	},
	6: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "• 'Ciclo das Águas': Garanta que X% do bioma seja áreas alagadas ou corpos d'água.",
		"title": "Tuiuiú"
	},
	7: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "• 'Ninhos para Tuiuiús': Coloque Z peças de Capões de Mata com Árvores Altas próximas às áreas alagadas.",
		"title": "Tuiuiú"
	},
	8: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "• 'Riqueza Aquática': Conecte diferentes tipos de Peças de Água, como rios, baías e corixos.",
		"title": "Tuiuiú"
	}
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_pantanal
	_hud.add_child(_new_dialog)
