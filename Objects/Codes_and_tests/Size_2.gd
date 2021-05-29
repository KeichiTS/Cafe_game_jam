extends StaticBody2D



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if body.grow >= 1.5:
			body.grow += 0.02
			queue_free()

