extends CharacterBody2D

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

func destroy():
	queue_free()

func _physics_process(delta):
	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")


