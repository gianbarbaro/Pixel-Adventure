extends AnimatedSprite2D

func _ready():
	if animation == "apple":
		play("apple")
	elif animation == "bananas":
		play("bananas")
	elif animation == "cherries":
		play("cherries")
	elif animation == "kiwi":
		play("kiwi")
	elif animation == "melon":
		play("melon")
	elif animation == "orange":
		play("orange")
	elif animation == "pineapple":
		play("pineapple")
	else:
		play("strawberry")

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		play("collected")
		await (self.animation_finished)
		queue_free()
