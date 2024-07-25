extends Node2D

func _on_player_1_pressed():
	#cuando le demos clic al personaje que queremos seleccionar, la variable player
	#del singleton va a cambiar al player que elegimos
	Singleton.player = load("res://Scenes/player.tscn")
	#una vez seleccionado el player, pasamos a la escena del primer nivel 
	get_tree().change_scene_to_file("res://Scenes/inicio.tscn")

func _on_player_2_pressed():
	Singleton.player = load("res://Scenes/player2.tscn")
	get_tree().change_scene_to_file("res://Scenes/inicio.tscn")

func _on_player_3_pressed():
	Singleton.player = load("res://Scenes/player3.tscn")
	get_tree().change_scene_to_file("res://Scenes/inicio.tscn")

func _on_player_4_pressed():
	Singleton.player = load("res://Scenes/player4.tscn")
	get_tree().change_scene_to_file("res://Scenes/inicio.tscn")
