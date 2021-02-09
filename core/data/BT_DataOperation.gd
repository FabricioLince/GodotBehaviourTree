class_name BT_DataOperation
extends BT_Data

export (String, "Add", "Subtract", "Multiply", "Divide", "Modulus") var operation

export (String) var lhs
export (bool) var indirect_lhs

export (String) var rhs
export (bool) var indirect_rhs

export (String) var save_result_in
export (bool) var indirect_result

func update():
	var lhs_value = (data.get(lhs, null) if indirect_lhs else lhs)
	var rhs_value = (data.get(rhs, null) if indirect_rhs else rhs)
	print("operation: ", lhs_value, " ", operation, " ", rhs_value)
	if lhs_value == null or rhs_value == null:
		set_failure()
		return
	else:
		lhs_value = int(lhs_value)
		rhs_value = int(rhs_value)
		var result = null
		match(operation):
			"Add":
				result = lhs_value + rhs_value
			"Subtract":
				result = lhs_value - rhs_value
			"Multiply":
				result = lhs_value * rhs_value
			"Divide":
				result = lhs_value / rhs_value
			"Modulus":
				result = lhs_value % rhs_value
		set_value(save_result_in, result, indirect_result)
		set_success()
	
