extends KinematicBody2D

var velocity = Vector2.ZERO
var push_factor = 5
var grow = 1


func _ready():
	$AudioStreamPlayer.play()

func _process(delta):
	scale = Vector2(grow,grow)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
		
	if input_vector != Vector2.ZERO:
		velocity += input_vector 
		velocity = velocity * delta * 50 
	else:
		velocity = Vector2.ZERO  
		
	move_and_slide(velocity*100,Vector2(0,0),false, 10, PI, false)
	
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * velocity.length() * push_factor)
	
