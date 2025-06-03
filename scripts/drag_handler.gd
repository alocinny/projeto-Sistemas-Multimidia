extends Node2D

func _process(delta):
	
	for i in range(GameState.hand_tiles.size()):	
		var tile = GameState.hand_tiles[i]
		
		if tile.is_being_dragged:
			tile.position = get_global_mouse_position() - tile.mouse_offset
		
		elif GameState.current_state == GameState.GameState.STOPPED_DRAG:
			tile.position =  tile.anchor_position
	
	if GameState.current_state == GameState.GameState.STOPPED_DRAG:
		GameState.current_state = GameState.GameState.WAITING_INPUT
