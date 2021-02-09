class_name BT_Invert
extends BT_Decorator

func update():
	if child.is_done():
		if child.status == Status.SUCCESS:
			status = Status.FAILURE
		else:
			status = Status.SUCCESS
	else:
		child.update()
