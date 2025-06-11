extends Node2D
class_name Level_Graxaim

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_pampa: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": "Oi! Sou o Graxaim-do-campo.",
		"title": "Graxaim-do-campo"
	},
	1: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": "No Pampa, o que vemos são vastos campos,",
		"title": "Graxaim-do-campo"
	},
	2: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": " mas não pense que são vazios!  Essas gramíneas e o solo armazenam muito carbono.",
		"title": "Graxaim-do-campo"
	},
	3: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": " A pecuária extensiva tem ameaçado a saúde desses campos, ",
		"title": "Graxaim-do-campo"
	},
	4: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": " o que pode liberar esse carbono.",
		"title": "Graxaim-do-campo"
	},
	5: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": "Ao criar Campos Nativos e Banhados Essenciais, ",
		"title": "Graxaim-do-campo"
	},
	6: {
		"faceset": "res://imagensNPC/real/graxaim.jpg",
		"dialog": "você está ajudando o solo a sequestrar ainda mais GEE e garantindo a água para a fauna local! ",
		"title": "Graxaim-do-campo"
	}
	
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_pampa
	_hud.add_child(_new_dialog)
