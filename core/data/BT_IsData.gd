class_name BT_IsData
extends BT_Node

export (Dictionary) var data_values

func update():
	for data_name in data_values:
		var value = BT_Data.evaluate(data_values[data_name], data)
		#print("testing ", data.get(data_name), " == ", value)
		if data.get(data_name) != value:
			set_failure()
			return
	set_success()
