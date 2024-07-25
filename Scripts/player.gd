extends CharacterBody2D

var velocidad = 150
var gravedad = 1050
var salto = 400

var salto_max = 2
var salto_cont 

var rayos

func _ready():
	rayos = $rayos.get_children()

func _physics_process(delta):
	#llamada a la función para plataformas estáticas traspasables
	detectar()
	
	#gravedad del player
	velocity.y += gravedad*delta
	
	#movimiento de izquierda a derecha
	if Input.is_action_pressed("derecha"):
		velocity.x = velocidad
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("izquierda"):
		velocity.x = -velocidad
		$AnimatedSprite2D.flip_h = true
	else: 
		velocity.x = 0
		
	#detecta el salto cuando esta en el suelo y no reconoce si la tecla se mantiene 
	#presionada
	if is_on_floor():
		salto_cont = 0 #reseteamos la variable cada vez que toca el suelo
		if Input.is_action_just_pressed("saltar"): #primer salto cuando esta en el suelo
			salto_cont += 1
			velocity.y = -salto
	else:
		if Input.is_action_just_released("saltar"): #regular salto del player
			velocity.y += 300 
		#segundo salto en el aire
		if Input.is_action_just_pressed("saltar") and salto_cont < salto_max:
			salto_cont += 1
			velocity.y = -salto+100
	move_and_slide()
	
	#animciones
	if is_on_floor():
		if velocity.x == 0:
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.play("run")
	else:
		#verifica que solo se haya hecho solo el primer salto para hacer la animación
		if salto_cont != 2:
			if velocity.y < 0:
				$AnimatedSprite2D.play("jump")
			else:
				$AnimatedSprite2D.play("fall")
		else:
			$AnimatedSprite2D.play("double jump")

#programar la muerte del player
func dead():
	#para que se deje de ejecutar el physics process ya que no nos interesa que se sigan
	#ejecutando las operaciones que hay dentro
	set_physics_process(false)
	$AnimatedSprite2D.play("dead")
	await ($AnimatedSprite2D.animation_finished)
	get_tree().get_nodes_in_group("main")[0].aparecer()
	queue_free()

#función para detectar la colisión con plataformas estáticas traspasables
func detectar():
	for i in rayos:
		#condicional para verificar si el player está o no colisionando
		if i.is_colliding():
			#si está colisionando, guardamos en una variable el objeto con el que colisiona
			var obj = i.get_collider()
			#verificamos si el objeto con el que colisona está en el grupo creado para
			#las plataformas estáticas traspasables 
			if obj.is_in_group("platform"):
				#si se cumple esa condición y se está presionando la tecla hacia abajo
				if Input.is_action_just_pressed("abajo"):
					#accedemos al colisionshape de nuestra plataforma y le decimos que rote
					#para cambiar la dirección de la colisión
					obj.get_node("CollisionShape2D").rotation_degrees = 180
					#creamos un timer por código para que pasado el tiempo la colisión
					#de la plataforma vuelva a su posición original
					await (get_tree().create_timer(0.1).timeout)
					obj.get_node("CollisionShape2D").rotation_degrees = 0
