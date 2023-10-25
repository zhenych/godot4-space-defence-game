extends CharacterBody2D

const BULLET_SCENE := preload("res://elements/enemy_bullet/enemy_bullet.tscn")

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

func destroy():
	queue_free()

func _physics_process(delta):
	if ray_cast_left.is_colliding() or ray_cast_right.is_colliding():
		get_tree().call_group("enemy_group", "change_direction")

func shot():
	var bullet = BULLET_SCENE.instantiate()
	bullet.top_level = true
	bullet.global_position = global_position + Vector2(0, 10)
	add_child(bullet)
	
