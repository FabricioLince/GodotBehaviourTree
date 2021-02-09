class_name BT_Runner
extends Node

export (NodePath) var runner_object = ".."
export (NodePath) var behavior_tree
var bt_node
export (bool) var reset_on_done = true

func _ready():
	if behavior_tree:
		bt_node = get_node(behavior_tree)
	else:
		for c in get_children():
			if c.is_class("BT_Node") or c.has_method("is_behavior_tree_node"):
				bt_node = c
				break
	if bt_node == null:
		push_error("No behavior tree set")
	else:
		if runner_object:
			bt_node.runner_object = get_node(runner_object)
			print("runner object: ", str(runner_object), " - ", bt_node.runner_object.name)
		else:
			bt_node.runner_object = get_node(".")

func _process(_delta):
	if bt_node:
		if bt_node.is_done():
			if reset_on_done:
				bt_node.reset()
		else:
			bt_node.update()
