extends Node2D
class_name Level_Ararinha

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_caatinga: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "Olá! Sou a Ararinha-azul.",
		"title": "Ararinha-azul"
	},
	1: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "Bem-vindo à Caatinga, um bioma de beleza árida!",
		"title": "Ararinha-azul"
	},
	2: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "Aqui, aprender a gerenciar os Pontos de Água Escassos e a manter a Vegetação Resiliente  é vital.",
		"title": "Ararinha-azul"
	},
	3: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "As secas estão mais intensas e imprevisíveis devido às mudanças climáticas, ",
		"title": "Ararinha-azul"
	},
	4: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "tornando a vida aqui um desafio ainda maior.  ",
		"title": "Ararinha-azul"
	},
	5: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "Sua missão de recriar esses oásis e plantar cactos adaptados",
		"title": "Ararinha-azul"
	},
	6: {
		"faceset": "res://imagensNPC/real/ararinha_azul.png",
		"dialog": "mostra como podemos nos adaptar e prosperar mesmo em condições extremas!",
		"title": "Ararinha-azul"
	}
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_caatinga
	_hud.add_child(_new_dialog)
