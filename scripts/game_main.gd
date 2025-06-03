extends Node2D

const Biome = preload("res://scripts/enums.gd").Biome
@onready var TileGenerator = $TileGenerator

var hand_tile

func _ready():
	hand_tile = TileGenerator.new_tile(Biome.PAMPAS)
