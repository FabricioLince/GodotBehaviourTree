class_name BT_MultipleUpdates
extends BT_Decorator

export (int) var updates_per_update = 10

func update():
	for _i in range(updates_per_update):
		if not child.is_done():
			child.update()
	status = child.status
