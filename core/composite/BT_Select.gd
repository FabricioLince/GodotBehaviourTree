class_name BT_Select, "res://scripts/BT/icons/select.png"
extends BT_Composite

func update():
	if cur >= children.size():
		status = Status.FAILURE
	else:
		var c = current_child()
		if c.status == Status.SUCCESS:
			status = Status.SUCCESS
		elif c.status == Status.FAILURE:
			cur += 1
		else:
			c.update()
