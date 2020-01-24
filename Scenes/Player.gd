extends KinematicBody2D

const SPEED = 700
# On indique la direction vers le haut 
const FLOOR_NORMAL = Vector2(0, -1)

# Pour le déplacement du personnage (direction)
var motion = Vector2()

# Update / tourne en boucle
func _physics_process(delta):
	# Si on appuie sur la touche droite ou D
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false # on regarde à droite
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true # on regarde à gauche
		motion.x = -SPEED
	else:
		$AnimatedSprite.play("idle")
		motion.x = 0
		
	move_and_slide(motion, FLOOR_NORMAL)