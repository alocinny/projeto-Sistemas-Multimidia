extends Node2D

var hand_tile
var anchor_position = Vector2.ZERO

func _process(delta):
	hand_tile = get_parent().hand_tile
	
	if hand_tile.is_being_dragged:
		hand_tile.position = get_global_mouse_position() - hand_tile.mouse_offset
		
	else:
		hand_tile.position = anchor_position
