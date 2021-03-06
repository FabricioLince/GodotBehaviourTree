extends Object

var factory

func _init(f):
	factory = f

func create(data):
	match data.name:
		"Fail":
			return create_decorator(BT_Fail, data)
		"Succeed":
			return create_decorator(BT_Succeed, data)
		"Invert":
			return create_decorator(BT_Invert, data)
		"Repeat":
			return create_repeat(data)
		"RepeatUntil":
			return create_repeat_until(data)
		"MultiUpdate":
			return create_multi_update(data)
			

func create_decorator(Type, data):
	var node = Type.new()
	if data.children.size() > 0:
		var child_node = factory.create(data.children[0])
		if child_node:
			node.add_child(child_node)
		else:
			push_warning("Couldn't create decorator node")
			return null
	if data.children.size() > 1:
		print("decorator children ", data.print(true, false))
		for d in data.children:
			print("\t", d.print(true, false))
		push_warning("Decorator with more than 1 children")
	return node

func create_repeat(data):
	var node = create_decorator(BT_Repeat, data)
	node.times = data.attributes.get("times", -1)
	return node
func create_repeat_until(data):
	var node = create_decorator(BT_RepeatUntil, data)
	match data.attributes.get("stop_at", "success").to_lower():
		"success":
			node.status_to_stop = BT_RepeatUntil.EndStatus.SUCCESS
		"failure":
			node.status_to_stop = BT_RepeatUntil.EndStatus.FAILURE
	return node

func create_multi_update(data):
	var node = create_decorator(BT_MultipleUpdates, data)
	node.updates_per_update = data.attributes.get("updates", 1)
	return node
