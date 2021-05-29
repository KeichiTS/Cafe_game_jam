extends RigidBody2D


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		if body.grow >= 4.5:
			body.grow += 0.06
			queue_free()

