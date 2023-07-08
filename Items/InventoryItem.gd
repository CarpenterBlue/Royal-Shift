extends Control
class_name InventoryItem

export var type := ""

func _gui_input(event):
	on_click(event)


func on_click(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == BUTTON_LEFT:
		var data = get_viewport().get_meta("drag",false)
		
		if data:
			if has_method("upgrade"):
				if data != self and data.type == type:
					call("upgrade",data)
					data.queue_free()
					get_viewport().set_meta("drag",false)
		else:
			hide()
			get_viewport().set_meta("drag",self)
