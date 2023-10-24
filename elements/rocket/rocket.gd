extends CharacterBody2D

const SPEED = 200.0

func _physics_process(delta):
	var collision: KinematicCollision2D = move_and_collide( Vector2.UP * SPEED * delta)
	if collision:
		var collider = collision.get_collider()
		# enemy collide
		print("kill enemy")
		queue_free()
		if collider.has_method("destroy"):
			collider.destroy()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
