extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
@onready var TileGenerator = $TileGenerator
@onready var HandManager = $HandManager

func _ready():
	for child in $Camera2D.get_children():
		var pos = child.global_position
		
		HandManager.hand_tiles.append(TileGenerator.new_tile(Biome.PAMPAS, pos)) 
		$TileSorter.add_child(HandManager.hand_tiles[int(child.name)])
		
	for child in $Camera2D.get_children():
		print(int(child.name))
		


func _on_drag_handler_hand_tile_removed(hand_pos: Variant) -> void:
	HandManager.replace_hand_tile(hand_pos)
