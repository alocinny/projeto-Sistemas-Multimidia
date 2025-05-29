extends Node2D
const  Biome = preload("res://scripts/enums.gd").Biome
const tile = preload("res://scenes/Tile.tscn")

var trees = {
	Biome.PAMPAS: [
		preload("res://Assets/elementos/pampas/angico-vermelho-512x512.png"),

		],
	Biome.CAATINGA: [
		preload("res://Assets/elementos/caatinga/joazeiro-512x512.png"),
		preload("res://Assets/elementos/caatinga/quixabeira-512x512.png")
	]
}
var bushes = {
	Biome.PAMPAS: [
		preload("res://Assets/elementos/pampas/babosa-512x512.png"),
		preload("res://Assets/elementos/pampas/capim-barba-de-bode-512x512.png")
	],
	Biome.CAATINGA: [
		preload("res://Assets/elementos/caatinga/bromelia-macambira-512x512.png"),
		preload("res://Assets/elementos/caatinga/jurema-512x512.png"),
		preload("res://Assets/elementos/caatinga/mandacaru-512x512.png")
	]
}

func new_tile(biome):
	var tile = tile.instantiate()
	tile.initialize_tile(biome, trees[biome], bushes[biome])
	add_sibling(tile)
