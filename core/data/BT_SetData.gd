class_name BT_SetData
extends BT_Node

export (Dictionary) var data_values

func update():
	#print("SetData ", data_values)
	for data_name in data_values:
		var value = BT_Data.evaluate(data_values[data_name], data)
		data[data_name] = value
		#print("setting ", data_name, " = ", value)
	set_success()
