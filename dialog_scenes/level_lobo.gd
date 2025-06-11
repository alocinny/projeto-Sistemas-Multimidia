extends Node2D

class_name Level_lobo

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": "Olá, sou o Lobo-guará!",
		"title": "Lobo-guará"
	},

	1: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": "Ah, o Cerrado! Não se engane pela aparência seca:",
		"title": "Lobo-guará"
	},

	2: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": "esta savana é uma caixa d'água crucial para o Brasil e um grande reservatório de carbono no solo.",
		"title": "Lobo-guará"
	},

	3: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": " A expansão agrícola desenfreada, porém, ameaça essa riqueza.",
		"title": "Lobo-guará"
	},

	4: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": "Cada mosaico que você cria, intercalando campos e árvores,",
		"title": "Lobo-guará"
	},

	5: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": " ajuda a manter a umidade e o carbono seguros no solo,",
		"title": "Lobo-guará"
	},

	6: {
		"faceset": "res://imagensNPC/real/lobo_guara.webp",
		"dialog": "fortalecendo a resiliência do bioma contra secas mais longas,um efeito da mudança climática.",
		"title": "Lobo-guará"
	}

}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	_hud.add_child(_new_dialog)
