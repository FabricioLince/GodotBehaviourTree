class_name BT_DataComparation
extends BT_Data

enum ComparationKind {
	EQUALS,
	NOT_EQUALS,
	BIGGER_THAN,
	BIGGER_OR_EQUAL,
	LESS_THAN,
	LESS_OR_EQUAL
}

export (String) var lhs
export (bool) var indirect_lhs = false
export (String) var rhs
export (bool) var indirect_rhs = false
export (ComparationKind) var comparation

func update():
	var lhs_value = data.get(lhs, null) if indirect_lhs else lhs
	var rhs_value = data.get(rhs, null) if indirect_rhs else rhs
	print("comparation: ", str(lhs_value), " ", comp_to_symbol(comparation), " ", str(rhs_value))
	if lhs_value == null or rhs_value == null:
		set_failure()
		return
		
	match(comparation):
		ComparationKind.EQUALS:
			set_result(lhs_value == rhs_value)
		ComparationKind.NOT_EQUALS:
			set_result(lhs_value != rhs_value)
		ComparationKind.BIGGER_THAN:
			set_result(lhs_value > rhs_value)
		ComparationKind.BIGGER_OR_EQUAL:
			set_result(lhs_value >= rhs_value)
		ComparationKind.LESS_THAN:
			set_result(lhs_value < rhs_value)
		ComparationKind.LESS_OR_EQUAL:
			set_result(lhs_value <= rhs_value)

func set_result(result:bool):
	if result:
		set_success()
	else:
		set_failure()

static func comp_to_symbol(comp) -> String:
	match(comp):
		ComparationKind.EQUALS:
			return "=="
		ComparationKind.NOT_EQUALS:
			return "!="
		ComparationKind.BIGGER_THAN:
			return ">"
		ComparationKind.BIGGER_OR_EQUAL:
			return ">="
		ComparationKind.LESS_THAN:
			return "<"
		ComparationKind.LESS_OR_EQUAL:
			return "<="
	return "?"
