extends CharacterBody2D

const SPEED = 300.0
const ROCKET_SCENE = preload("res://elements/rocket/rocket.tscn")

func _physics_process(delta: float):
	if Input.is_action_just_pressed("ui_accept"):
		shot()
#	var direction = Input.get_axis("ui_left", "ui_right")
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction.x == 0 and direction.y == 0:
		return
		
	# Distance in current frame
	var distance = 	SPEED * delta
	# Movement x using velocity
	velocity.x = direction.x * SPEED
	move_and_slide()

func shot():
	var rocket = ROCKET_SCENE.instantiate()
	rocket.top_level = true
	rocket.global_position = global_position + Vector2(0, -30)
	add_child(rocket)
