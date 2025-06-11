extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
@onready var TileGenerator = $TileGenerator
@onready var HandManager = $HandManager
var level_biome = Biome.CAATINGA
var river_sizes = []
var forest_sizes = []
var field_sizes = []

func generate_initial_tiles():
	for child in $Camera2D.get_children():
		var pos = child.global_position
		
		HandManager.hand_tiles.append(TileGenerator.new_tile(level_biome, pos)) 
		$TileSorter.add_child(HandManager.hand_tiles[int(child.name)])
		

func _on_drag_handler_hand_tile_removed(hand_pos: Variant) -> void:
	HandManager.replace_hand_tile(hand_pos, level_biome)


func _on_tile_grid_tile_placement(river_array: Variant, forest_array: Variant, field_array: Variant) -> void:
	river_sizes = river_array
	forest_sizes = forest_array
	field_sizes = field_array
