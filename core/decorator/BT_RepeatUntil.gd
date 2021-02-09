class_name BT_RepeatUntil, "res://scripts/BT/icons/repeat.png"
extends BT_Decorator

enum EndStatus {SUCCESS, FAILURE}

export (EndStatus) var status_to_stop
var sts_to_stop

func _ready():
	match(status_to_stop):
		EndStatus.SUCCESS:
			sts_to_stop = Status.SUCCESS
		EndStatus.FAILURE:
			sts_to_stop = Status.FAILURE

func update():
	if child.is_done():
		if child.status == sts_to_stop:
			status = Status.SUCCESS
		else:
			child.reset()
	else:
		child.update()
