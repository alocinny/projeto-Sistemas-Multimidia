extends Node2D

class_name GameTile

enum biome {PAMPAS, CAATINGA}

var icon = preload("res://icon.svg")
var elements = {
	biome.PAMPAS: [
		preload("res://Assets/elementos/pampas/angico-vermelho-512x512.png"),
		preload("res://Assets/elementos/pampas/babosa-512x512.png"),
		preload("res://Assets/elementos/pampas/capim-barba-de-bode-512x512.png")
		],
	biome.CAATINGA: [
		preload("res://Assets/elementos/caatinga/bromelia-macambira-512x512.png"),
		preload("res://Assets/elementos/caatinga/joazeiro-512x512.png"),
		preload("res://Assets/elementos/caatinga/jurema-512x512.png"),
		preload("res://Assets/elementos/caatinga/mandacaru-512x512.png"),
		preload("res://Assets/elementos/caatinga/quixabeira-512x512.png")
	]
}

@onready var base = $Base

func _ready():
	base.texture = preload("res://Assets/elementos/pampas/solo-gramado-completo512.png")
	place_elements()

func place_elements():
	for i in 4:
			var x = randi_range(0, 128)
			var y = randi_range(0, -x/2 + 128)
			
			var sprite = Sprite2D.new()
			sprite.texture = icon
			sprite.texture = elements[biome.PAMPAS][0]
			sprite.position = Vector2(x, y - 128)
			sprite.z_index = 1
			add_child(sprite)
