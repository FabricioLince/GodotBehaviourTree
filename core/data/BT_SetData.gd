class_name BT_SetData
extends BT_Data

export (String) var data_name
export (bool) var indirect_name = false
export (String) var data_value
export (bool) var indirect_value = false

func update():
	if indirect_value:
		set_value(data_name, data.get(data_value), indirect_name)
		print("setting ", data_name, " = ", data_value , " = ", data.get(data_value))
	else:
		set_value(data_name, data_value, indirect_name)
		print("setting ", data_name, " = ", data_value)
	set_success()
