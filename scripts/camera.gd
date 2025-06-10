extends Camera2D

@export var move_speed = 2000.0

func _process(delta):   
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	
	if direction.length() > 0:
		direction = direction.normalized()
	
	position += direction * move_speed * delta
