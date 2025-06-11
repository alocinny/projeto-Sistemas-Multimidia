extends Node2D

signal tile_placement(river_array, forest_array, field_array)

const EdgeType = preload("res://scripts/enums.gd").EdgeType
const Biome = preload("res://scripts/enums.gd").Biome
const TILE_SIZE = GameState.TILE_SIZE
var tiles = {} #dictionary<Vector2i, Tile>
var vacant_spots = {} #dictionary<Vector2i, Vector2> coordenadas relativas e globais dos espacos vazios
var forbidden_spots = {}

var direction = {
	Vector2i.UP: 1,
	Vector2i.RIGHT: 2,
	Vector2i.DOWN: 3,
	Vector2i.LEFT: 0,	
}

var opposite_direction = {
	Vector2i.UP: 3,
	Vector2i.RIGHT: 0,
	Vector2i.DOWN: 1,
	Vector2i.LEFT: 2,
}

func _ready() -> void:
	update_vacant()
	
func place_tile(pos, tile):
	tiles[pos] = tile
	update_vacant()
	
	tile_placement.emit(get_group_sizes(EdgeType.RIVER), get_group_sizes(EdgeType.TREE), get_group_sizes(EdgeType.BUSH))
	print("Rios: ",get_group_sizes(EdgeType.RIVER))
	print("Florestas: ",get_group_sizes(EdgeType.TREE))
	print("Campos: ",get_group_sizes(EdgeType.BUSH))
	print("")
	
func update_vacant():
	vacant_spots.clear()
	forbidden_spots.clear()
	
	if tiles:
		for pos in tiles.keys():
			for dir in [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]:
				var neighbor = pos + dir
				
				if not tiles.has(neighbor):
					vacant_spots[neighbor] = grid_to_global_coords(neighbor)
				
				if get_parent().level_biome != Biome.PANTANAL:	
					if GameState.dragged_tile and !can_place_tile(dir, tiles[pos]):
						forbidden_spots[neighbor] = grid_to_global_coords(neighbor)
	else:
		vacant_spots[Vector2i(0, 0)] = Vector2(0, 0)
	
func can_place_tile(dir, tile):
	if tile.edges[direction[dir]] != GameState.dragged_tile.edges[opposite_direction[dir]]:
		if tile.edges[direction[dir]] == EdgeType.RIVER or GameState.dragged_tile.edges[opposite_direction[dir]] == EdgeType.RIVER:
			return false
	
	return true
	
func get_group_sizes(type):
	var visited = {}
	var group_sizes = []
	
	for pos in tiles.keys():
		if visited.has(pos):
			continue
		
		var tile = tiles[pos]
		if tile == null:
			continue
			
		var is_valid := false
		match type:
			EdgeType.TREE:
				is_valid = EdgeType.TREE in tile.edges
			EdgeType.RIVER:
				is_valid = EdgeType.RIVER in tile.edges
			EdgeType.BUSH:
				is_valid = EdgeType.TREE not in tile.edges
				
		if not is_valid:
			continue
			
		var size = flood_fill(pos, visited, type)
		group_sizes.append(size)
		
	return group_sizes


func flood_fill(start_pos, visited, type):
	if visited.has(start_pos):
		return 0
		
	var stack = [start_pos]
	var count = 0
	
	while stack.size() > 0:
		var current = stack.pop_back()
		if visited.has(current):
			continue
		visited[current] = true
		
		var tile = tiles.get(current)
		if tile == null:
			continue
			
		var is_valid := false
		match type:
			EdgeType.TREE:
				is_valid = EdgeType.TREE in tile.edges
			EdgeType.RIVER:
				is_valid = EdgeType.RIVER in tile.edges
			EdgeType.BUSH:
				is_valid = EdgeType.TREE not in tile.edges
				
		if not is_valid:
			continue
			
		count += 1
		
		for dir in [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]:
			var neighbor_pos = current + dir
			if visited.has(neighbor_pos):
				continue
				
			var neighbor = tiles.get(neighbor_pos)
			if neighbor == null:
				continue
				
			match type:
				EdgeType.RIVER:
					var i = direction[dir]
					if tile.edges[i] == EdgeType.RIVER:
						var opposite_i = opposite_direction[dir]
						if neighbor.edges[opposite_i] == EdgeType.RIVER:
							stack.append(neighbor_pos)
							
				EdgeType.TREE:
					if EdgeType.TREE in neighbor.edges:
						stack.append(neighbor_pos)
						
				EdgeType.BUSH:
					if EdgeType.TREE not in neighbor.edges:
						stack.append(neighbor_pos)

	return count

func grid_to_global_coords(pos):
	@warning_ignore("integer_division")
	var x = (pos.x - pos.y) * (TILE_SIZE / 2)
	@warning_ignore("integer_division")
	var y = (pos.x + pos.y) * (TILE_SIZE / 4)
	return Vector2(x, y)
	
func global_to_grid_coords(pos: Vector2) -> Vector2i:
	@warning_ignore("integer_division")
	var x = (pos.x / (TILE_SIZE / 2) + pos.y / (TILE_SIZE / 4)) / 2
	@warning_ignore("integer_division")
	var y = (pos.y / (TILE_SIZE / 4) - pos.x / (TILE_SIZE / 2)) / 2
	return Vector2i(round(x), round(y))
