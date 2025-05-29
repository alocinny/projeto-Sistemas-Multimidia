extends Node2D

#TODO: ajustar logica de padding, ta estranho

const Biome = preload("res://scripts/enums.gd").Biome
const EdgeType = preload("res://scripts/enums.gd").EdgeType
const SIZE_IMG = 512
const HALF_IMG = SIZE_IMG/2
const QUARTER_IMG = SIZE_IMG/4
const PADDING = 50
var edges = []
@onready var base = $Base

func _ready():
	base.texture = preload("res://Assets/elementos/pampas/solo-gramado-completo512.png")

func initialize_tile(biome, trees, bushes):
	var tree_prob
	var tree_density
	# densidade de arbustos eh fixa
	
	match biome:
		Biome.PAMPAS: 
			tree_prob = 0.50
			tree_density = 1
		Biome.CAATINGA: 
			tree_prob = 0.10
			tree_density = 1
		
	for i in 4:	
		if randf() < tree_prob:
			edges.append(EdgeType.TREE)
			place_elements(trees, tree_density, i)
		else:
			edges.append(EdgeType.BUSH)
			place_elements(bushes, 2, i)
			
	

func place_elements(textures, density, edge_index):
	var a # esquerda ou direita do eixo y
	var b # acima ou abaixo do eixo x
	
	# reta: mx + n
	var m
	var n
	
	match edge_index:
		0:
			a = 1
			b = -1
			m = 0.5
			n = -1 * QUARTER_IMG
		1:
			a = 1
			b = 1
			m = -0.5
			n = 1 * QUARTER_IMG
		2:
			a = -1
			b = 1
			m = 0.5
			n = 1 * QUARTER_IMG
		3:
			a = -1
			b = -1
			m = -0.5
			n = -1 * QUARTER_IMG
	
	for i in density:
		var x = randi_range(PADDING*a, (HALF_IMG - PADDING)*a)
		var y = randi_range(PADDING*b, m*x + n - PADDING*b)
		
		var sprite = Sprite2D.new()
		sprite.texture = textures[0]
		sprite.position = Vector2(x, y - HALF_IMG)
		sprite.z_index = sprite.position.y + HALF_IMG + QUARTER_IMG + 1
		add_child(sprite)
