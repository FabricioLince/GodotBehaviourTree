extends Object

var factory

func _init(f):
	factory = f

func create(data):
	match data.name.to_lower():
		"setdata":
			return create_set_data(data)
		"isdata":
			return create_is_data(data)


func create_set_data(data):
	var node = BT_SetData.new()
	node.data_values = data.attributes
	return node
func create_is_data(data):
	var node = BT_IsData.new()
	node.data_values = data.attributes
	return node
