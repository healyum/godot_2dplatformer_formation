extends CanvasLayer

func _ready():
	$Label.text = "0"

func change_val(val):
	$Label.text = str(val)
