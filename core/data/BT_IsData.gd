class_name BT_IsData
extends BT_Node

export (Dictionary) var data_values

func update():
	for data_name in data_values:
		if data.get(data_name) != data_values[data_name]:
			set_failure()
			return
	set_success()
