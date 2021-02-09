class_name BT_DebugPrint
extends BT_Node

export (String) var message
export (String) var data_name

func update():
	if message and message.length() > 0:
		print(message)
	if data_name and data_name.length() > 0:
		update2()
	else:
		for k in data.keys():
			print(str(k), " = ", str(data[k]))
	set_success()

func update2():
	if data.has(data_name):
		print(data_name, " = ", str(data[data_name]))
	else:
		print(data_name, " = null")
	set_success()
