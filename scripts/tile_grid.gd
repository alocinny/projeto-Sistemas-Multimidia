extends Node2D

const TILE_SIZE = GameState.TILE_SIZE
var tiles = {} #dictionary<Vector2i, Tile>
var vacant_spots = {} #dictionary<Vector2i, Vector2> coordenadas relativas e globais dos espacos vazios

func _ready() -> void:
	update_vacant()
	
func place_tile(pos, tile):
	tiles[pos] = tile
	update_vacant()
	
func update_vacant():
	vacant_spots.clear()
	
	if tiles:
		for pos in tiles.keys():
			for dir in [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]:
				var neighbor = pos + dir
				if not tiles.has(neighbor):
					vacant_spots[neighbor] = grid_to_global_coords(neighbor)
					
	else:
		vacant_spots[Vector2i(0, 0)] = Vector2(0, 0)
	
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
