class_name BT_Fail
extends BT_Decorator

func update():
	if child.is_done():
		status = Status.FAILURE
	else:
		child.update()
