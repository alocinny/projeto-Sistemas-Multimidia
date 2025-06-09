extends Node

enum GameState {
	WAITING_INPUT,
	STARTED_DRAG,
	DRAGGING,
	STOPPED_DRAG
}

var current_state = GameState.WAITING_INPUT

const TILE_SIZE = 512
var dragged_tile
