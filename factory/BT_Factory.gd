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
	return null

class ExtraFactory:
	func create(data):
		if data.name == "print":
			return create_print(data)
		if data.name.to_lower() == "script":
			return create_run_script(data)
	func create_print(data):
		var node = BT_DebugPrint.new()
		node.message = data.content
		return node
	func create_run_script(data):
		var node = BT_RunScript.new()
		node.script_code = data.content
		return node
