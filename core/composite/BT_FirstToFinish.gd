extends "res://scripts/BT/core/composite/BT_Composite.gd"
class_name BT_FirstToFinish

enum EndStatus {ANY, SUCCESS, FAILURE}

export (EndStatus) var desired_status = EndStatus.ANY

func update():
	if children.size() == 0:
		status = Status.FAILURE
		return
	
	if not children[cur].is_done():
		children[cur].update()
	
	if children[cur].is_done():
		if desired_status == EndStatus.ANY:
			status = children[cur].status
		elif children[cur].status == desired_status:
			status = Status.SUCCESS
	
	cur = (cur+1) % children.size()


