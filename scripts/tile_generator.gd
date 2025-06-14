extends Node2D
const Biome = preload("res://scripts/enums.gd").Biome
const EdgeType = preload("res://scripts/enums.gd").EdgeType
const tile = preload("res://scenes/core_gameplay/Tile.tscn")

var trees = {
	Biome.PAMPAS: [
		preload("res://Assets/elementos/pampas/angico-vermelho-512x512.png"),
		],
	Biome.CAATINGA: [
		preload("res://Assets/elementos/caatinga/joazeiro-512x512.png"),
		preload("res://Assets/elementos/caatinga/quixabeira-512x512.png")
	],
	Biome.PANTANAL: [
		preload("res://Assets/elementos/pantanal/cambara.png")
	],
	Biome.AMAZONIA: [
		preload("res://Assets/elementos/amazonia/acai.png"),
		preload("res://Assets/elementos/amazonia/andiroba.png"),
		preload("res://Assets/elementos/mata_atlantica/cajueiro.png"),
		preload("res://Assets/elementos/amazonia/parapara.png")
	],
	Biome.CERRADO: [
		preload("res://Assets/elementos/cerrado/ipe_amarelo.png"),
		preload("res://Assets/elementos/cerrado/ipe_rosa.png"),
		preload("res://Assets/elementos/cerrado/Jabuticaba.png"),
	],
	Biome.MATA_ATLANTICA: [
		preload("res://Assets/elementos/mata_atlantica/cajueiro.png"),
		preload("res://Assets/elementos/mata_atlantica/goiabeira.png"),
		preload("res://Assets/elementos/mata_atlantica/pitangueira.png")
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
	],
	Biome.PANTANAL: [
		preload("res://Assets/elementos/pantanal/acuri.png")
	],
	Biome.AMAZONIA: [
		preload("res://Assets/elementos/pampas/capim-barba-de-bode-512x512.png"),
	],
	Biome.CERRADO: [
		preload("res://Assets/elementos/cerrado/mosquitinho.png")
	],
	Biome.MATA_ATLANTICA: [
		preload("res://Assets/elementos/mata_atlantica/bromelias-orquideas.png")
	],
}

var rivers = [
	preload("res://Assets/elementos/pampas/rio-meio-sem-chao-512x512.png"),
	preload("res://Assets/elementos/pampas/rio-meio-2-512x512.png"),
	preload("res://Assets/elementos/pampas/rio-canto-frente-512x512.png"),
	preload("res://Assets/elementos/pampas/rio-canto-esquerda-512x512.png"),
	preload("res://Assets/elementos/pampas/rio-canto-direita-512x512.png"),
	preload("res://Assets/elementos/pampas/rio-canto-atras-512x512.png")
]

var pantano = preload("res://Assets/elementos/pantanal/pantano.png")

func new_tile(biome, pos):
	var tile = tile.instantiate()
	var edges = choose_river(biome)
	var river = choose_river_sprite(edges)
	edges = choose_edges(biome, edges)
	
	tile.position = pos
	tile.hand_position = pos
	tile.anchor_position = pos
	tile.initialize_tile(biome, trees[biome], bushes[biome], edges, river)
	
	return tile
	
func choose_edges(biome, edges):
	var tree_prob = 0.20
	
	if biome == Biome.AMAZONIA:
		tree_prob = 2
			
	for i in 4:
		if edges[i] != EdgeType.RIVER and randf() < tree_prob:
			edges.set(i, EdgeType.TREE)
			
	return edges
	
func choose_river(biome):
	var edges
	var rand = randf()
	
	if biome == Biome.PANTANAL:
		if rand < 0.15:
			edges = [EdgeType.RIVER, EdgeType.RIVER, EdgeType.RIVER, EdgeType.RIVER]
		else:
			edges = [EdgeType.BUSH, EdgeType.BUSH, EdgeType.BUSH, EdgeType.BUSH]
			
		return edges
	
	if rand < 0.025:
		edges = [EdgeType.RIVER, EdgeType.BUSH, EdgeType.RIVER, EdgeType.BUSH]
	elif rand < 0.05:
		edges = [EdgeType.BUSH, EdgeType.RIVER, EdgeType.BUSH, EdgeType.RIVER]
	elif rand < 0.075:
		edges = [EdgeType.RIVER, EdgeType.RIVER, EdgeType.BUSH, EdgeType.BUSH]
	elif rand < 0.1:
		edges = [EdgeType.BUSH, EdgeType.RIVER, EdgeType.RIVER, EdgeType.BUSH]
	elif rand < 0.125:
		edges = [EdgeType.BUSH, EdgeType.BUSH, EdgeType.RIVER, EdgeType.RIVER]
	elif rand < 0.15:
		edges = [EdgeType.RIVER, EdgeType.BUSH, EdgeType.BUSH, EdgeType.RIVER]
	else:
		edges = [EdgeType.BUSH, EdgeType.BUSH, EdgeType.BUSH, EdgeType.BUSH]
		
	return edges
	
func choose_river_sprite(edges):
	var river
	
	match edges:
		[EdgeType.RIVER, EdgeType.BUSH, EdgeType.RIVER, EdgeType.BUSH]:
			river = rivers[0]
		[EdgeType.BUSH, EdgeType.RIVER, EdgeType.BUSH, EdgeType.RIVER]:
			river = rivers[1]
		[EdgeType.RIVER, EdgeType.RIVER, EdgeType.BUSH, EdgeType.BUSH]:
			river = rivers[5]
		[EdgeType.BUSH, EdgeType.RIVER, EdgeType.RIVER, EdgeType.BUSH]:
			river = rivers[4]
		[EdgeType.BUSH, EdgeType.BUSH, EdgeType.RIVER, EdgeType.RIVER]:
			river = rivers[2]
		[EdgeType.RIVER, EdgeType.BUSH, EdgeType.BUSH, EdgeType.RIVER]:
			river = rivers[3]
		[EdgeType.RIVER, EdgeType.RIVER, EdgeType.RIVER, EdgeType.RIVER]:
			river = pantano
		[EdgeType.BUSH, EdgeType.BUSH, EdgeType.BUSH, EdgeType.BUSH]:
			river = null
	
	return river
