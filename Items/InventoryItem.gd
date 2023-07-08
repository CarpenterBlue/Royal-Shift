extends Control
class_name InventoryItem

func _gui_input(event):
	if event is InputEventMouseButton and event.is_pressed():
		var data = get_viewport().set_meta("drag",self)
		hide()

func use(enemy):
	pass
