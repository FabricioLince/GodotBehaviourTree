extends BT_Node
class_name BT_RunScript

export (String) var script_code setget set_code

var sc

func set_code(code):
	script_code = code
	sc = null
	#print("running script ", script_code)

func compile():
	var source = "var data;var object\nfunc foo(): " + script_code
#	print("source:")
#	print(source)
	
	var Base = GDScript.new()
	Base.source_code = source
	Base.reload()
	sc = Base.new()

func update():
	if sc == null:
		compile()
	sc.data = data
	sc.object = runner_object
	var r = sc.call("foo")
	if r == false:
		set_failure()
	else:
		set_success()
