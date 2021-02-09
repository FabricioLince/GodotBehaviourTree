extends Object

var factory

func _init(f):
	factory = f

func create(data):
	match data.name:
		"Fail":
			return create_decorator(BT_Fail, data)
		"Invert":
			return create_decorator(BT_Invert, data)
		"Repeat":
			return create_repeat(data)
		"RepeatUntil":
			return create_repeat_until(data)
			

func create_decorator(Type, data):
	var node = Type.new()
	if data.children.size() > 0:
		node.add_child(factory.create(data.children[0]))
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
