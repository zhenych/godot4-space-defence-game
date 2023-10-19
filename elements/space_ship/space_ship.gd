extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta):

	# Handle Action.
	if Input.is_action_just_pressed("ui_accept") :
		pass
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction.x == 0 and direction.y == 0:
		return
	# Current object position
	var current_position = global_transform.origin
	# Distance in current frame
	var distance = 	SPEED * delta
	# Calculate movement to direction to the distance
	var next_point: Vector2 = current_position + (direction.normalized() * distance)
#	# for 3d
#	var next_point: Vector3 = current_position + (direction.normalized() * distance)
	# Movement
	global_transform.origin = next_point
#	velocity.x = direction.x * SPEED
	

	move_and_slide()
