extends KinematicBody2D

var velocity = Vector2(150, 0)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)

func _on_Area2D_body_entered(body):
	get_tree().reload_current_scene()
