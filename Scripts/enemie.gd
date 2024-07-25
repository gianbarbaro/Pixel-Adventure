extends CharacterBody2D

var velocidad = 50
var velocidad2 = 120
var perseguir = false

func _ready():
	#iniciamos el movimiento del enemigo en una dirección
	velocity.x = -velocidad
	
func _physics_process(delta):
	#reproducimos esta animación ya que siempre se va a estar moviendo
	$AnimatedSprite2D.play("run")
	
	detectar()
	#movimiento del enemigo mientras no detecte al player
	if !perseguir:
		#verificamos si el enemigo esta chocando con alguna pared para cambiar su dirección
		if is_on_wall():
			if !$AnimatedSprite2D.flip_h: #cuando choca por izquierda
				velocity.x = velocidad
			else: #cuando choca por derecha
				velocity.x = -velocidad
				
	#condicional para rotar el sprite del enemigo en la dirección que camina
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
		$down.position.x = -10 #ubicar el raycast a la izq del enemigo
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
		$down.position.x = 10 #ubicar el raycast a la der del enemigo
	
	#condicional para que le enemigo detecte precipicios y asi cambiar la dirección
	#de su velocidad
	if !$down.is_colliding():
		velocity.x *= -1
	
	move_and_slide()

#función para detectar al player y aumentar la velocidad del enemigo
func detectar():
	if $right.is_colliding():
		var obj = $right.get_collider()
		if obj.is_in_group("player"):
			perseguir = true
			velocity.x = velocidad2
		else:
			perseguir = false
			
	if $left.is_colliding():
		var obj = $left.get_collider()
		if obj.is_in_group("player"):
			perseguir = true
			velocity.x = -velocidad2
		else:
			perseguir = false

#detectamos cuando el player colisiona con el enemigo y lo eliminamos
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		#con esta función detenemos el physics process para que el enemigo no se mueva
		#mientras se reproduce su animación de hit
		set_physics_process(false)
		$AnimatedSprite2D.play("hit")
		body.dead()
		#cuando termina la animación volvemos a activar el physics process
		await ($AnimatedSprite2D.animation_finished)
		set_physics_process(true)
