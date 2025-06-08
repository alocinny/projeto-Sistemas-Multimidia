extends Node2D
class_name Level_Graxaim

const _DIALOG_SCREEN: PackedScene = preload("res://graxaim_dialogo.tscn")

var _dialog_pampa: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "Oi! Sou o Graxaim-do-campo (Lycalopex gymnocercus).",
		"title": "Graxaim-do-campo"
	},
	1: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "Sou um canídeo campestre ameaçado pela agricultura e pecuária.",
		"title": "Graxaim-do-campo"
	},
	2: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "O Pampa tem campos nativos com gramíneas, coxilhas e banhados.",
		"title": "Graxaim-do-campo"
	},
	3: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "Também há matas ciliares importantes para a fauna local.",
		"title": "Graxaim-do-campo"
	},
	4: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "Missões:",
		"title": "Graxaim-do-campo"
	},
	5: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "• 'Vastos Campos Abertos': Crie uma área contínua com pelo menos X peças de Campo Nativo.",
		"title": "Graxaim-do-campo"
	},
	6: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "• 'Diversidade de Gramíneas': Inclua W tipos diferentes de Campo com Gramíneas Nativas.",
		"title": "Graxaim-do-campo"
	},
	7: {
		"faceset": "res://imagensNPC/vector-pixel-art-wolf-head-isolated-cartoon-127963772.png",
		"dialog": "• 'Banhados Essenciais': Coloque X peças de Banhado (área úmida).",
		"title": "Graxaim-do-campo"
	}
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_pampa
		_hud.add_child(_new_dialog)
