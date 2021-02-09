class_name BT_Decorator
extends BT_Node

var child

func _ready():
	for c in get_children():
		if is_behavior_tree_node(c):
			if child == null:
				child = c
			else:
				push_warning("decorator with more than one child")

func reset():
	.reset()
	child.reset()

func set_runner_object(obj):
	.set_runner_object(obj)
	set_data_for_child(child)
	child.set_runner_object(runner_object)
	
