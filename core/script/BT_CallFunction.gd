extends BT_Node
class_name BT_CallFunction

var target_path : NodePath = "." 
var target: Object = null
var function_name : String
var parameters = []

func update():
	if target == null and target_path != null:
		target = runner_object.get_node(target_path)
	var result = target.callv(function_name, parameters)
	if result == false:
		set_failure()
	else:
		set_success()
