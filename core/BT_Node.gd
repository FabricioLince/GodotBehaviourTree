class_name BT_Node
extends Node

enum Status { RUNNING, SUCCESS, FAILURE }

var status = Status.RUNNING
var runner_object setget set_runner_object

export (Dictionary) var data

func _ready():
	for child in get_children():
		if is_behavior_tree_node(child):
			set_data_for_child(child)

func set_data_for_child(child:BT_Node):
	for cd in child.data.keys():
		data[cd] = child.data[cd]
	child.data = data
	
func update():
	push_error("update not implemented")
	status = Status.FAILURE

func reset():
	status = Status.RUNNING

func run():
	while status == Status.RUNNING:
		update()

func is_behavior_tree_node(node:Node): 
	return node.is_class("BT_Node") or node.has_method("is_behavior_tree_node")

func is_done(): 
	return status != Status.RUNNING

func set_runner_object(obj):
	runner_object = obj

func set_success():
	status = Status.SUCCESS
func set_failure():
	status = Status.FAILURE


func path():
	var s = name
	var p = get_parent()
	while p:
		s =  p.name + "/" + s
		p = p.get_parent()
	return s

static func status_name(status_):
	match(status_):
		Status.RUNNING:
			return "RUNNING"
		Status.SUCCESS:
			return "SUCCESS"
		Status.FAILURE:
			return "FAILURE"

func copy_data_to(other:Dictionary):
	for d in data.keys():
		if not other.has(d):
			other[d] = data[d]
