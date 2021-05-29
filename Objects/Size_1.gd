extends RigidBody2D


func _physics_process(delta):
	pass


func _on_Area2D_body_entered(body):
		if body.name == "Player":
			if body.grow >= 0.8:
				body.grow += 0.01
				queue_free()
