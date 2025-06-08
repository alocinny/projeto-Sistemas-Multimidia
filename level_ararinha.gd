extends Node2D
class_name Level_Ararinha

const _DIALOG_SCREEN: PackedScene = preload("res://ararinha_dialogo.tscn")

var _dialog_caatinga: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Olá! Sou a Ararinha-azul (Cyanopsitta spixii).",
		"title": "Ararinha-azul"
	},
	1: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Estou extinta na natureza, mas há projetos de reintrodução.",
		"title": "Ararinha-azul"
	},
	2: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Dependo da árvore Caraibeira para sobreviver.",
		"title": "Ararinha-azul"
	},
	3: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "A Caatinga é um bioma semiárido com vegetação xerófita.",
		"title": "Ararinha-azul"
	},
	4: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Tem cactos, arbustos espinhosos e rios intermitentes.",
		"title": "Ararinha-azul"
	},
	5: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "Missões:",
		"title": "Ararinha-azul"
	},
	6: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "• 'Vegetação Resiliente': Adicione X peças de Caatinga Arbustiva e Y de Caatinga Arbórea.",
		"title": "Ararinha-azul"
	},
	7: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "• 'Pontos de Água Escassos': Crie W pequenos açudes ou poças temporárias.",
		"title": "Ararinha-azul"
	},
	8: {
		"faceset": "res://imagensNPC/arara_azul.webp",
		"dialog": "• 'Cactos Presentes': Adicione M peças contendo cactáceas como mandacaru e xique-xique.",
		"title": "Ararinha-azul"
	}
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_caatinga
		_hud.add_child(_new_dialog)
