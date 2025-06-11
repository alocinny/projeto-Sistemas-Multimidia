extends Node2D
class_name Level_Mico

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_mata_atlantica: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "Oi! Sou o Mico-leão-dourado.",
		"title": "Mico-leão-dourado"
	},
	1: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "Na Mata Atlântica, você está no bioma mais fragmentado do Brasil, ",
		"title": "Mico-leão-dourado"
	},
	2: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "mas incrivelmente rico!",
		"title": "Mico-leão-dourado"
	},
	3: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": " A criação de corredores ecológicos aqui não é apenas para mim, o Mico-leão-dourado:",
		"title": "Mico-leão-dourado"
	},
	4: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": " ela permite que as espécies se movam e se adaptem às mudanças de temperatura e umidade causadas pelo clima. ",
		"title": "Mico-leão-dourado"
	},
	5: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "É como dar uma rota de fuga à natureza!",
		"title": "Mico-leão-dourado"
	},
	6: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "• 'Ao restaurar a diversidade de árvores  e criar essas conexões, ",
		"title": "Mico-leão-dourado"
	},
	7: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "você está construindo um bioma mais forte e resiliente!",
		"title": "Mico-leão-dourado"
	}
	
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_mata_atlantica
	_hud.add_child(_new_dialog)
