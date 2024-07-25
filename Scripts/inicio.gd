extends Node2D

var ruta = ""
var player

func _ready():
	#inicializamos el player
	player = Singleton.player
	#hacemos aparecer al player
	aparecer()

func aparecer():
	#creo una nueva instancia del player
	var newplayer = player.instantiate()
	#hacemos aparecer al player en la posición del spawn
	newplayer.position = $spawnPlayer.position
	call_deferred("add_child", newplayer)

func _input(event):
	#verificamos que se este presionando la tecla para interactuar y la variable
	#ruta no este vacia (asi no nos tira un error) para camibiar de escena
	if Input.is_action_just_pressed("interactuar") and ruta != "":
		get_tree().change_scene_to_file(ruta)

func _on_level_1_body_entered(body):
	#nos aseguramos que solo detecte al player
	if body.is_in_group("player"):
		#almacenamos la ruta de la escena del nivel al que queremos ir 
		ruta = "res://Scenes/main.tscn"

func _on_level_2_body_entered(body):
	if body.is_in_group("player"):
		ruta = "res://Scenes/level_2.tscn"

func _on_level_3_body_entered(body):
	if body.is_in_group("player"):
		ruta = "res://Scenes/level_3.tscn"

func _on_level_4_body_entered(body):
	if body.is_in_group("player"):
		ruta = "res://Scenes/level_4.tscn"

func _on_level_5_body_entered(body):
	if body.is_in_group("player"):
		ruta = "res://Scenes/level_5.tscn"

func _on_level_1_body_exited(body):
	ruta = ""

func _on_level_2_body_exited(body):
	ruta = ""

func _on_level_3_body_exited(body):
	ruta = ""

func _on_level_4_body_exited(body):
	ruta = ""

func _on_level_5_body_exited(body):
	ruta = ""
