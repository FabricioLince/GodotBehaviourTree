extends "res://scripts/BT/core/composite/BT_Composite.gd"
class_name BT_AllFinished

func update():
	if children.size() == 0:
		status = Status.FAILURE
		return
	
	if not children[cur].is_done():
		children[cur].update()
	
	cur = (cur+1) % children.size()
	
	for c in children:
		if not c.is_done():
			return
	status = Status.SUCCESS


