extends Object
class_name InputAdaptor

enum EVENT_SOURCE_TYPE {UI_SELECT, UI_CANCEL, UI_ACCEPT}
const EVENT_SOURCE = {
	EVENT_SOURCE_TYPE.UI_SELECT: "ui_select",
	EVENT_SOURCE_TYPE.UI_CANCEL: "ui_cancel",
	EVENT_SOURCE_TYPE.UI_ACCEPT: "ui_accept",
}
enum MOUSE_EVENT {PRESS, RELEASE, DRAG, NEUTRAL}

func _get_source(source_type):
	if not source_type in EVENT_SOURCE:
		printerr("Unkown source type: {}".format([source_type], "{}"))
	return EVENT_SOURCE.get(source_type)

func on_ui_event(event): 
	pass

func on_mouse_press(event):
	pass

func on_mouse_release(event):
	pass 
	
func on_mouse_drag(event):
	pass

func on_mouse_neutral(event):
	pass
			
func handle_ui(event, source_type=EVENT_SOURCE.UI_SELECT):
	if event.is_action_pressed(_get_source(source_type)):
		on_ui_event(event)

func handle_mouse(event) -> int:
	if event is InputEventMouseButton:
		if event.is_pressed():
			on_mouse_press(event)
			return MOUSE_EVENT.PRESS
		else:
			on_mouse_release(event)
			return MOUSE_EVENT.RELEASE
	if event is InputEventMouseMotion:
		if event.is_pressed():
			on_mouse_drag(event)
			return MOUSE_EVENT.DRAG
	on_mouse_neutral(event)
	return MOUSE_EVENT.NEUTRAL
	


	
