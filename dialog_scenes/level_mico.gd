extends Node2D
class_name Level_Mico

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_mata_atlantica: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "Oi! Sou o Mico-leão-dourado (Leontopithecus rosalia).",
		"title": "Mico-leão-dourado"
	},
	1: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "Sou símbolo da luta pela conservação do bioma.",
		"title": "Mico-leão-dourado"
	},
	2: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "Dependo de florestas bem preservadas e conectadas para sobreviver.",
		"title": "Mico-leão-dourado"
	},
	3: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "O bioma é uma floresta tropical úmida, densa e rica em biodiversidade.",
		"title": "Mico-leão-dourado"
	},
	4: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "O relevo é acidentado e sofre muito com a fragmentação.",
		"title": "Mico-leão-dourado"
	},
	5: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "Missões:",
		"title": "Mico-leão-dourado"
	},
	6: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "• 'Corredores Ecológicos': Crie Y corredores de Mata Ciliar adjacentes a rios.",
		"title": "Mico-leão-dourado"
	},
	7: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "• 'Riqueza de Epífitas': Adicione W peças de Floresta com Epífitas (bromélias, orquídeas).",
		"title": "Mico-leão-dourado"
	},
	8: {
		"faceset": "res://imagensNPC/real/mico.png",
		"dialog": "• 'Reintroduzindo a Variedade': Garanta ao menos 3 tipos diferentes de árvores nativas.",
		"title": "Mico-leão-dourado"
	}
}



@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_mata_atlantica
	_hud.add_child(_new_dialog)
