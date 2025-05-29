extends Node2D

const  Biome = preload("res://scripts/enums.gd").Biome

@onready var TileGenerator = $TileGenerator

func _ready():
	TileGenerator.new_tile(Biome.PAMPAS)
