extends CanvasLayer

func _on_ButtonPlay_pressed():
	get_tree().change_scene("res://Scenes/Level1.tscn")

func _on_ButtonExit_pressed():
	get_tree().quit()