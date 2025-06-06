extends Node2D

signal hand_tile_removed(hand_pos)

@onready var tile_grid = get_node("../TileGrid")
@onready var hand_manager = get_node("../HandManager")
var closest_anchor

func _process(_delta):
	var moved_tile = null
	var vacant_hand_pos = null
	
	for hand_pos in hand_manager.hand_tiles:
		var tile = hand_manager.hand_tiles[hand_pos]
		closest_anchor = tile.hand_position
		
		if tile.is_being_dragged:
			var mouse_pos = get_global_mouse_position() 
			tile.position = mouse_pos - tile.mouse_offset
			
			for key in tile_grid.vacant_spots:
				var pos = tile_grid.vacant_spots[key] 
				if pos.distance_to(mouse_pos) < tile.anchor_position.distance_to(mouse_pos):
					closest_anchor = pos
					
				tile.anchor_position = closest_anchor
		
		elif GameState.current_state == GameState.GameState.STOPPED_DRAG:
			if tile.anchor_position != tile.hand_position:
				tile.has_moved = true
				moved_tile = tile
				vacant_hand_pos = hand_pos
			tile.position = tile.anchor_position
	
	if moved_tile:
		move_tile_to_grid(moved_tile, vacant_hand_pos)
	
	if GameState.current_state == GameState.GameState.STOPPED_DRAG:
		moved_tile = null
		GameState.current_state = GameState.GameState.WAITING_INPUT

func move_tile_to_grid(tile, hand_pos):
	var tile_sorter = get_node("../HandTiles/TileSorter")
	var grid_coords = tile_grid.global_to_grid_coords(tile.anchor_position)

	tile_sorter.remove_child(tile)
	tile_grid.add_child(tile)
	tile.get_node("Area2D").set_process(false)
	tile.get_node("Area2D").set_process_input(false)
	
	tile_grid.vacant_spots.erase(grid_coords)
	hand_manager.hand_tiles.erase(hand_pos)
	emit_signal("hand_tile_removed", hand_pos)

	tile.global_position = tile.global_position
	tile_grid.place_tile(grid_coords, tile)
