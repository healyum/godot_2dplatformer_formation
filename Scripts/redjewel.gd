extends Sprite

# charge l'objet Player une fois que tous les scripts sont chargés
onready var PlayerScript = get_tree().get_root().find_node("Player", true, false)

func _on_Area2D_body_entered(body):
	PlayerScript.coins += 1
	print(PlayerScript.coins)
	queue_free() # fait disparaitre le sprit
