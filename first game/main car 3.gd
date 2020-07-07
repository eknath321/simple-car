extends KinematicBody

	
var velocity = Vector3()

func _physics_process(delta):
	
	var speed = 10
	var acceleration = 5
	var body_rotation_angle = 1
	var movement = Vector3()
	var movement_basis = self.get_global_transform().basis
	
	if Input.is_action_pressed("ui_select"):
		speed=0
		body_rotation_angle = 0
		
	else:
		speed=speed
		body_rotation_angle = body_rotation_angle
	
	if Input.is_action_pressed("ui_up"):
		movement -= movement_basis.x 
		
	if Input.is_action_pressed("ui_down"):
		movement += movement_basis.x
		
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
		self.rotate_y(deg2rad(-body_rotation_angle))
		
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
		self.rotate_y(deg2rad(body_rotation_angle))
		
	
	movement = movement.normalized()
	velocity = velocity.linear_interpolate(movement * speed, acceleration * delta)
	
	move_and_slide(velocity)
