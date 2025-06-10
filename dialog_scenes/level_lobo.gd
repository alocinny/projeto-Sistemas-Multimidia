extends Node2D

class_name Level_lobo

const _DIALOG_SCREEN: PackedScene = preload("res://dialog_scenes/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Olá, sou o Lobo-guará! Habito as áreas abertas do Cerrado.",
		"title": "Lobo-guará"
	},

	1: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Este bioma é uma savana cheia de campos, árvores tortas e arbustos.",
		"title": "Lobo-guará"
	},

	2: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Aqui as estações são bem marcadas: uma época seca e outra bem chuvosa.",
		"title": "Lobo-guará"
	},

	3: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Eu sobrevivo comendo pequenos frutos e caçando animais menores.",
		"title": "Lobo-guará"
	},

	4: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Mas a expansão agrícola está acabando com meu lar.",
		"title": "Lobo-guará"
	},

	5: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Você pode me ajudar a preservar esse ecossistema tão importante?",
		"title": "Lobo-guará"
	},

	6: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Missão 1: Crie um 'Mosaico do Cerrado'.",
		"title": "Lobo-guará"
	},

	7: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Intercale pelo menos X peças de Campo Limpo com Y peças de Cerrado Stricto Sensu (com árvores).",
		"title": "Lobo-guará"
	},

	8: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Missão 2: Plante Árvores Frutíferas Nativas!",
		"title": "Lobo-guará"
	},

	9: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Adicione Z peças de árvores como pequizeiros ou muricis ao mapa.",
		"title": "Lobo-guará"
	},

	10: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Missão 3: Garanta acesso à água.",
		"title": "Lobo-guará"
	},

	11: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Coloque pelo menos uma peça de Nascente ou Vereda no território.",
		"title": "Lobo-guará"
	},

	12: {
		"faceset": "res://imagensNPC/wolf-head-in-pixel-art-style-vector.jpg",
		"dialog": "Conto com você para manter o Cerrado vivo. Boa sorte, guardião!",
		"title": "Lobo-guará"
	}
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _ready() -> void:
	var _new_dialog = _DIALOG_SCREEN.instantiate()
	_new_dialog.data = _dialog_data
	_hud.add_child(_new_dialog)
