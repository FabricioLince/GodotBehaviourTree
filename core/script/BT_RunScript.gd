extends BT_Node
class_name BT_RunScript

export (String) var script_code


func update():
	print("running script ", script_code)

	var source = "func foo():\n" + script_code 
	source = source.replace("\n", "\n\t")
	source = "var data\n" + source
	print("source:")
	print(source)
	
	var Base = GDScript.new()
	Base.source_code = source
	Base.reload()
	var sc = Base.new()
	sc.data = data
	var r = sc.call("foo")
	if r == null or r:
		set_success()
	else:
		set_failure()
