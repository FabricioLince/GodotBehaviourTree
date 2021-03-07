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
		"FirstToFinish":
			return create_first_to_finish(data)
		"AllFinished":
			return create_composite(BT_AllFinished, data)

func create_composite(Type, data):
	var node = Type.new()
	for c in data.children:
		var child_node = factory.create(c)
		if child_node:
			node.add_child(child_node)
	return node

func create_first_to_finish(data):
	var node = create_composite(BT_FirstToFinish, data)
	match data.attributes.get("status", "any").to_lower():
		"any":
			node.desired_status = BT_FirstToFinish.EndStatus.ANY
		"success":
			node.desired_status = BT_FirstToFinish.EndStatus.SUCCESS
		"failure":
			node.desired_status = BT_FirstToFinish.EndStatus.FAILURE
	return node
