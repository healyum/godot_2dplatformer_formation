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
		motion.x = SPEED
		print("right")
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		print("left")		
	else:
		motion.x = 0
		
	move_and_slide(motion, FLOOR_NORMAL)