class_name BT_Repeat, "res://scripts/BT/icons/repeat.png"
extends BT_Decorator

export (int) var times

var times_done = 0

func update():
	if times > 0 and times_done == times:
		status = Status.SUCCESS
	else:
		if child.is_done():
			child.reset()
			times_done += 1
		else:
			child.update()

func reset():
	.reset()
	times_done = 0
