extends Node2D

var tile = preload("res://scenes/GameTile.tscn")

func _ready() -> void:
	var instance = tile.instantiate()
	add_child(instance)
