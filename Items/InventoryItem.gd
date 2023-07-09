extends Control
class_name InventoryItem

export var type := ""

func _gui_input(event):
	on_click(event)


func on_click(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		var data = get_viewport().get_meta("drag",false)
		
		if data:
			if data != self and data.type == type:
				if has_method("upgrade"):
					call("upgrade",data)
					data.queue_free()
					get_viewport().set_meta("drag",false)
		else:
			get_viewport().set_meta("drag",self)
			hide()
