extends KinematicBody2D

const SPEED = 700
# On indique la direction vers le haut 
const FLOOR_NORMAL = Vector2(0, -1)

const GRAVITY = 2000

const JUMP_FORCE = -1000

# Pour le déplacement du personnage (direction)
var motion = Vector2()

var coins = 0

var coin_sound

var jump_sound

func _ready():
	coin_sound = load("res://Sounds/coin1.wav")
	jump_sound = load("res://Sounds/jump_01.wav")

# Update / tourne en boucle
func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Scenes/Menu.tscn")
	walk()
	gravity(delta)
	jump()
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
		
func jump():
	if is_on_floor() and Input.is_action_pressed("jump"):
		motion.y = JUMP_FORCE
		play_jump()
	if motion.y < 0:
		$AnimatedSprite.play("jump")
		
func play_jump():
	$AudioStreamPlayer2D.stream = jump_sound
	$AudioStreamPlayer2D.play()
		
func play_coin():
	$AudioStreamPlayer2D.stream = coin_sound
	$AudioStreamPlayer2D.play()
