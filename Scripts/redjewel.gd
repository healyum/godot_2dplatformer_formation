extends Sprite

# charge l'objet Player une fois que tous les scripts sont chargés
onready var PlayerScript = get_tree().get_root().find_node("Player", true, false)
onready var GUIScript = get_tree().get_root().find_node("GUI", true, false)

func _on_Area2D_body_entered(body):
	PlayerScript.play_coin()
	PlayerScript.coins += 1
	GUIScript.change_val(PlayerScript.coins)
	queue_free() # fait disparaitre le sprit
