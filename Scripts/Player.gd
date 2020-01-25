extends KinematicBody2D

const SPEED = 700
# On indique la direction vers le haut 
const FLOOR_NORMAL = Vector2(0, -1)

const GRAVITY = 2000

# Pour le déplacement du personnage (direction)
var motion = Vector2()

# Update / tourne en boucle
func _physics_process(delta):
	walk()
	gravity(delta)
	move_and_slide(motion, FLOOR_NORMAL)
	
func walk():
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
		
func gravity(delta):
	if is_on_floor(): # si on touche le sol on ne tombe pas
		motion.y = 0
	else: # sinon appliqué gravité
		motion.y += GRAVITY * delta