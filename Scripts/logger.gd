extends Object

class_name Logger

enum MODE {INFO, DEBUG}
const STATUS_PASSED = "PASSED"
const STATUS_FAILED = "FAILED"

func _get_formatted_message(status, msg):
	var logged_by = get_stack()[-2]
	var stamp = Time.get_datetime_string_from_system()
	return "{}, [{}] {}\n\tlogged by: {}".format([stamp, status, msg, logged_by], "{}")
	
func _log(status, msg, mode):
	var final_msg = _get_formatted_message(status, msg)
	if MODE.INFO == mode:
		print(final_msg)
	elif MODE.DEBUG == mode:
		print_debug(final_msg)
		
func log_info(status, msg):
	_log(status, msg, MODE.INFO)

func log_debug(status, msg):
	_log(status, msg, MODE.DEBUG)

func format(msg, args):
	return msg.format(args, "{}")
