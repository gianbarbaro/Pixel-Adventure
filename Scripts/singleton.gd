extends Node

var player
var ruta
var level_actual

func _ready():
	player = load("res://Scenes/player.tscn")

func next_level():
	match level_actual:
		"main":
			ruta = "res://Scenes/level_2.tscn"
		"level2":
			ruta = "res://Scenes/level_3.tscn"
		"level3":
			ruta = "res://Scenes/level_4.tscn"
		"level4":
			ruta = "res://Scenes/level_5.tscn"
		"level5":
			ruta = "res://Scenes/level_6.tscn"
		"level6":
			ruta = "res://Scenes/level_7.tscn"
		"level7":
			ruta = "res://Scenes/level_8.tscn"
		"level8":
			ruta = "res://Scenes/level_9.tscn"
		"level9":
			ruta = "res://Scenes/end.tscn"
	get_tree().change_scene_to_file(ruta)
