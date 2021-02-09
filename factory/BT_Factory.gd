extends Object
class_name BT_Factory

var factories

func _init():
	var composite_factory = load("res://scripts/BT/factory/BT_CompositeFactory.gd").new(self)
	var decorator_factory = load("res://scripts/BT/factory/BT_DecoratorFactory.gd").new(self)
	
	factories = [
		composite_factory,
		decorator_factory,
		ExtraFactory.new()
	]

func create(data) -> BT_Node:
	for f in factories:
		var node = f.create(data)
		if node: return node
	push_warning(data.name + " was not recognized as a BT_Node")
	return null

class ExtraFactory:
	func create(data):
		match data.name.to_lower():
			"print":
				return create_print(data)
			"script":
				return create_run_script(data)
			"setdata":
				return create_set_data(data)
			"isdata":
				return create_is_data(data)
	
	func create_print(data):
		var node = BT_DebugPrint.new()
		node.message = data.content
		return node
	func create_run_script(data):
		var node = BT_RunScript.new()
		node.script_code = data.content
		return node
	func create_set_data(data):
		var node = BT_SetData.new()
		node.data_values = data.attributes
		return node
	func create_is_data(data):
		var node = BT_IsData.new()
		node.data_values = data.attributes
		return node
