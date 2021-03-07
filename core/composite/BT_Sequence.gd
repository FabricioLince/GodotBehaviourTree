class_name BT_Sequence, "res://scripts/BT/icons/sequence.png"
extends BT_Composite

func update():
	if cur >= children.size():
		status = Status.SUCCESS
	
	var c = children[cur]
	if not c.is_done():
		c.update()
	
	if c.status == Status.SUCCESS:
		cur += 1
	elif c.status == Status.FAILURE:
		status = Status.FAILURE
	
	if cur >= children.size():
		status = Status.SUCCESS
