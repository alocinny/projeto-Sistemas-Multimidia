extends Node

enum GameState {
	WAITING_INPUT,
	DRAGGING,
	STOPPED_DRAG
}

var current_state = GameState.WAITING_INPUT

const TILE_SIZE = 512
var dragged_tile
var hand_tiles = []

# solucao temporaria
var hand_positions = [Vector2(-1280, 900), Vector2(-640, 900), Vector2(-0, 900), Vector2(640, 900), Vector2(1280, 900)]
