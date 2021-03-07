class_name BT_Composite
extends BT_Node

var children = []
var cur = 0

func _ready():
	for c in get_children():
		if is_behavior_tree_node(c) and not c in children:
			children.append(c)

func reset():
	.reset()
	cur = 0
	for c in children:
		c.reset()

func current_child():
	return children[cur]

func set_runner_object(obj):
	.set_runner_object(obj)
	for c in children:
		set_data_for_child(c)
		c.set_runner_object(obj)

func add_child(c, legible_unique_name: bool = false):
	if is_behavior_tree_node(c):
		children.append(c)
	.add_child(c, legible_unique_name)
