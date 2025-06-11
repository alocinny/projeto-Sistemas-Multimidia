extends Node2D

signal hand_tile_removed(hand_pos)

@onready var tile_grid = get_node("../TileGrid")
@onready var hand_manager = get_node("../HandManager")
@onready var camera = get_node("../Camera2D")
var preview_tile
var closest_anchor
var closest_distance

func _process(_delta):
	var moved_tile = null
	var vacant_hand_pos = null
	closest_distance = INF
	
	for child in camera.get_children():
		var hand_pos = int(child.name)
		var tile = hand_manager.hand_tiles[hand_pos]
		tile.hand_position = child.global_position
		closest_anchor = tile.hand_position
		
		if tile.is_being_dragged:
			if GameState.current_state == GameState.GameState.STARTED_DRAG:
				GameState.dragged_tile = tile
				tile_grid.update_vacant()
				tile_grid.vacant_spots["hand"] = child.global_position
				create_preview(tile)
				GameState.current_state = GameState.GameState.DRAGGING
			
			var mouse_pos = get_global_mouse_position() 
			tile.position = mouse_pos - tile.mouse_offset
			
			var changed_anchor = false
			for key in tile_grid.vacant_spots:
				var pos = tile_grid.vacant_spots[key] 
				
				if tile_grid.forbidden_spots.has(key):
					continue
				
				var dist = pos.distance_to(mouse_pos)
					
				if dist < closest_distance:
					changed_anchor = true
					closest_distance = dist
					closest_anchor = pos

				tile.anchor_position = closest_anchor
			
			if changed_anchor:
				move_preview(closest_anchor)
		
		elif GameState.current_state == GameState.GameState.STOPPED_DRAG:
			GameState.dragged_tile = null
			if tile.anchor_position != tile.hand_position:
				tile.has_moved = true
				moved_tile = tile
				vacant_hand_pos = hand_pos
			tile.position = tile.anchor_position
			
			end_preview()
			
		elif !tile.has_moved:
			tile.anchor_position = tile.hand_position
			tile.position = tile.anchor_position
	
	if moved_tile:
		move_tile_to_grid(moved_tile, vacant_hand_pos)
	
	if GameState.current_state == GameState.GameState.STOPPED_DRAG:
		moved_tile = null
		GameState.current_state = GameState.GameState.WAITING_INPUT

func move_tile_to_grid(tile, hand_pos):
	var tile_sorter = get_node("../TileSorter")
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
	
func create_preview(tile):
	preview_tile = tile.duplicate(true)
	preview_tile.modulate = Color(1, 1, 1, 0.4)
	add_child(preview_tile)
	
func end_preview():
	if preview_tile:
		preview_tile.queue_free()
		preview_tile = null

func move_preview(position):
	preview_tile.global_position = position
