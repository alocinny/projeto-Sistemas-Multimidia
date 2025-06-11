extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
@onready var TileGenerator = get_node("../TileGenerator")
@onready var TileSorter = get_node("../TileSorter")
@onready var Camera = get_node("../Camera2D")
var hand_tiles = []

# solucao temporaria
var hand_positions = [Vector2(-1280, 900), Vector2(-640, 900), Vector2(-0, 900), Vector2(640, 900), Vector2(1280, 900)]

func replace_hand_tile(hand_pos, biome):
	var new_tile = TileGenerator.new_tile(biome, Camera.get_child(hand_pos).global_position)
	hand_tiles[hand_pos] = new_tile
	TileSorter.add_child(new_tile)
	
