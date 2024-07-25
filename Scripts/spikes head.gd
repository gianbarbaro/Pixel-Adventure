extends Area2D

func _ready():
	$AnimationPlayer.play("move")

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.dead()
