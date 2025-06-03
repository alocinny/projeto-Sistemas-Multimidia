extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
@onready var TileGenerator = $TileGenerator

func _ready():
	for pos in GameState.hand_positions:
		GameState.hand_tiles.append(TileGenerator.new_tile(Biome.PAMPAS, pos))
	
	for tile in GameState.hand_tiles:
		$HandTiles/TileSorter.add_child(tile)
