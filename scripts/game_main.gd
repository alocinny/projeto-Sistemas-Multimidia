extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
@onready var TileGenerator = $TileGenerator
@onready var HandManager = $HandManager

func _ready():
	for pos in HandManager.hand_positions:
		HandManager.hand_tiles[pos] = TileGenerator.new_tile(Biome.PAMPAS, pos)
	
	for tile in HandManager.hand_tiles.values():
		$HandTiles/TileSorter.add_child(tile)


func _on_drag_handler_hand_tile_removed(hand_pos: Variant) -> void:
	HandManager.replace_hand_tile(hand_pos)
