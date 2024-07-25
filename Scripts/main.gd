extends Node2D

var player
var checkpoint = false #no está activo el checkpoint
var list = []

func _ready():
	#inicializamos el player
	player = Singleton.player
	#hacemos aparecer al player
	aparecer()

func aparecer():
	#creo una nueva instancia del player
	var newplayer = player.instantiate()
	if !checkpoint:
		#spawn si todavía no está activo el checkpoint
		newplayer.position = $spawnPlayer.position
	else:
		#spawn en el checkpoint
		newplayer.position = $checkpoint.position
	call_deferred("add_child", newplayer)

#usamos el singleton junto con el process para pasar de nivel cuando se juntan
#todas las frutas
func _process(delta):
	list = $fruits.get_children()
	if list.size() == 0:
		Singleton.level_actual = name
		#condicional momentaneo hasta que se agregue el nivel final 
		if Singleton.level_actual != "end":
			Singleton.next_level()
