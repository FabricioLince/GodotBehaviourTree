class_name BT_Data
extends BT_Node

static func evaluate(string, data):
	if typeof(string) != TYPE_STRING:
		return string
	while string.find("$") >= 0:
		string = format_string(string, data)
	return from_string(string)

static func format_string(string, data):
	var regex = RegEx.new()
	regex.compile("\\$(?<name>[\\w]+)")
	for m in regex.search_all(string):
		var data_name = m.get_string("name")
		#print(data_name)
		string = string.replace("$"+data_name, str(data.get(data_name, "null")))
	return string

static func from_string(string):
	if string.is_valid_integer():
		return int(string); #print("int")
	elif string.is_valid_float():
		return float(string); #print("float")
	elif string.begins_with("\"") and string.ends_with("\""):
		return string.substr(1, string.length()-2); #print("string")
	elif string.to_lower() == "null":
		return null
	elif string.to_lower() == "true":
		return true
	elif string.to_lower() == "false":
		return false
	else:
		return string
