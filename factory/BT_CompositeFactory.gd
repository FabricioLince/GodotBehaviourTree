extends Object

var factory

func _init(f):
	factory = f

func create(data):
	match data.name:
		"Sequence":
			return create_composite(BT_Sequence, data)
		"Select":
			return create_composite(BT_Select, data)

func create_composite(Type, data):
	var node = Type.new()
	for c in data.children:
		node.add_child(factory.create(c))
	return node
