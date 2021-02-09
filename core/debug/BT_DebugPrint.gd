class_name BT_DebugPrint
extends BT_Node

export (String) var message

func update():
	if message and message.length() > 0:
		print(BT_Data.format_string(message, data))
	else:
		for k in data.keys():
			print(str(k), " = ", str(data[k]))
	set_success()
