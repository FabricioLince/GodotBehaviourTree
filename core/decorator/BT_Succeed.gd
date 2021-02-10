class_name BT_Succeed
extends BT_Decorator

func update():
	if child.is_done():
		status = Status.SUCCESS
	else:
		child.update()
