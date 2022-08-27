extends Object
class_name InputAdapter

enum EVENT_SOURCE_TYPE {UI_SELECT, UI_CANCEL, UI_ACCEPT}
const EVENT_SOURCE = {
	EVENT_SOURCE_TYPE.UI_SELECT: "ui_select",
	EVENT_SOURCE_TYPE.UI_CANCEL: "ui_cancel",
	EVENT_SOURCE_TYPE.UI_ACCEPT: "ui_accept",
}


func _get_source(source_type):
	if not source_type in EVENT_SOURCE:
		printerr("Unkown source type: {}".format([source_type], "{}"))
	return EVENT_SOURCE.get(source_type)

func on_event(event): 
	pass

func on_press(event):
	pass

func on_release(event):
	pass 
	
func on_drag(event):
	pass

func on_neutral(event):
	pass
			
func handle_ui(event, source_type=EVENT_SOURCE.UI_SELECT):
	if event.is_action_pressed(_get_source(source_type)):
		on_event(event)

func handle_mouse(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			on_press(event)
		else:
			on_release(event)
	if event is InputEventMouseMotion:
		if event.is_pressed():
			on_drag(event)
	on_neutral(event)
	

	
