extends Node2D
class_name Level

const _DIALOG_SCREEN: PackedScene = preload("res://scenes/dialog_screen.tscn")

var _dialog_data: Dictionary = {
	0: {
		"faceset": "res://imagensNPC/ddb55c3bee30478a8285c1b4bc7f06ebJFioUK5wMbS9OC4g-0.png",
		"dialog": "Olá, aventureiro! Aqui no Cerrado, cuidar da natureza é muito importante.",
		"title": "Dog"
	},
	
	1: {
		"faceset": "res://imagensNPC/ddb55c3bee30478a8285c1b4bc7f06ebJFioUK5wMbS9OC4g-0.png",
		"dialog": "Para avançar, você precisa plantar 5 árvores nativas nesta área.",
		"title": "Dog"
	},
	
	2: {
		"faceset": "res://imagensNPC/ddb55c3bee30478a8285c1b4bc7f06ebJFioUK5wMbS9OC4g-0.png",
		"dialog": "Quando terminar, volte aqui para eu te mostrar o caminho!",
		"title": "Dog"
	},
	
	3: {
		"faceset": "res://imagensNPC/ddb55c3bee30478a8285c1b4bc7f06ebJFioUK5wMbS9OC4g-0.png",
		"dialog": "Vamos juntos proteger o nosso Cerrado!",
		"title": "Dog"
	},
	
	4: {
		"faceset": "res://imagensNPC/ddb55c3bee30478a8285c1b4bc7f06ebJFioUK5wMbS9OC4g-0.png",
		"dialog": "Até logo!",
		"title": "Dog"
	},
	
}

@export_category("Objects")
@export var _hud: CanvasLayer = null

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select"):
		var _new_dialog: DialogScreen = _DIALOG_SCREEN.instantiate()
		_new_dialog.data = _dialog_data
		_hud.add_child(_new_dialog)
