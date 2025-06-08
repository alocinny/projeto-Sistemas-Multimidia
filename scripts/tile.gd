extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
const EdgeType = preload("res://scripts/enums.gd").EdgeType
const SIZE_IMG = GameState.TILE_SIZE
@warning_ignore("integer_division") const HALF_IMG = SIZE_IMG/2
@warning_ignore("integer_division") const QUARTER_IMG = SIZE_IMG/4
const PADDING = 50

var edges = []
var elements = [[],[],[],[]]
var anchor_position
var hand_position
var has_moved = false
var is_being_dragged = false
var mouse_offset = Vector2.ZERO

func initialize_tile(biome, trees, bushes, given_edges, river):
	var tree_prob
	var tree_density
	var bush_density
	
	if river:
		place_river(river)
	
	match biome:
		Biome.PAMPAS: 
			tree_density = 1
			bush_density = 2
		Biome.CAATINGA: 
			tree_density = 1
			bush_density = 1
		
	for i in 4:	
		if given_edges[i] == EdgeType.TREE:
			place_elements(trees, tree_density, i)
		elif given_edges[i] == EdgeType.BUSH: 
			place_elements(bushes, randi_range(0, bush_density), i)
			
	edges = given_edges

func place_elements(textures, density, edge_index):
	var a # esquerda ou direita do eixo y
	var b # acima ou abaixo do eixo x
	
	# reta: mx + n
	var m
	var n
	
	match edge_index:
		0:
			a = 1
			b = 1
			m = 0.5
			n = -1 * QUARTER_IMG
		1:
			a = 1
			b = -1
			m = -0.5
			n = 1 * QUARTER_IMG
		2:
			a = -1
			b = -1
			m = 0.5
			n = 1 * QUARTER_IMG
		3:
			a = -1
			b = 1
			m = -0.5
			n = -1 * QUARTER_IMG
	
	for i in density:
		var x = randi_range(0, (HALF_IMG - PADDING)*a)
		var y = randi_range(0, m*x + n + PADDING*b)
		
		var sprite = Sprite2D.new()
		sprite.texture = textures[randi_range(0, textures.size() - 1)]
		sprite.position = Vector2(x, y - HALF_IMG + 12)
		#sprite.z_index = sprite.position.y + HALF_IMG + QUARTER_IMG + 1
		elements[edge_index].append(sprite)
		$Elements.add_child(sprite)
		

func place_river(river):
	var sprite = Sprite2D.new()
	sprite.texture = river
	sprite.position = Vector2.ZERO
	$River.add_child(sprite)

func _on_area_2d_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	if !has_moved:
		if Input.is_action_just_pressed("m1"):
			GameState.current_state = GameState.GameState.DRAGGING
			is_being_dragged = true
			mouse_offset = get_local_mouse_position()
			
	if Input.is_action_just_released("m1"):
		GameState.current_state = GameState.GameState.STOPPED_DRAG
		is_being_dragged = false
		mouse_offset = Vector2.ZERO
