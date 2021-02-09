class_name BT_Data
extends BT_Node

func set_value(name, value, indirect_name):
	if indirect_name:
		if data.has(name):
			data[data[name]] = value
		else:
			push_error("impossible to save '"+name+"' indirectly in "+path())
	else:
		data[name] = value
