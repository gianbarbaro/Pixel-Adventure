extends Area2D

func _ready():
	$AnimatedSprite2D.play("idle")

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_parent().checkpoint = true
		$AnimatedSprite2D.play("moving")
		await ($AnimatedSprite2D.animation_finished)
		$AnimatedSprite2D.play("idle")
