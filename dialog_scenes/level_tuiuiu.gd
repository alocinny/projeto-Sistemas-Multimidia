extends Node2D
class_name Level_Tuiuiu

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_pantanal: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Olá! Sou o Tuiuiú, símbolo do Pantanal.",
		"title": "Tuiuiú"
	},
	1: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Aqui no Pantanal, tudo gira em torno da água e do seu ciclo incrível!",
		"title": "Tuiuiú"
	},
	2: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Mas as secas extremas e inundações fora de época,",
		"title": "Tuiuiú"
	},
	3: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "intensificadas pelas mudanças climáticas, ameaçam esse equilíbrio.",
		"title": "Tuiuiú"
	},
	4: {
		"faceset": "res://imagensNPC/real/tuiuiu.jpg",
		"dialog": "Ao garantir o Ciclo das Águas, você ajuda a manter o pulso do bioma.",
		"title": "Tuiuiú"
	}
	
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_pantanal
	_hud.add_child(_new_dialog)
