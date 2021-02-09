class_name BT_Runner
extends Node

export (NodePath) var runner_object_path = ".."
export (NodePath) var behavior_tree_path
var tree_node
export (bool) var reset_on_done = true

func _ready():
	if behavior_tree_path:
		tree_node = get_node(behavior_tree_path)
	else:
		for c in get_children():
			if c.is_class("BT_Node") or c.has_method("is_behavior_tree_node"):
				tree_node = c
				break
	if tree_node == null:
		push_error("No behavior tree set")
	else:
		if runner_object_path:
			tree_node.runner_object = get_node(runner_object_path)
			print("runner object: ", str(runner_object_path), " - ", tree_node.runner_object.name)
		else:
			tree_node.runner_object = get_node(".")

func _process(_delta):
	if tree_node:
		if tree_node.is_done():
			if reset_on_done:
				tree_node.reset()
		else:
			tree_node.update()
