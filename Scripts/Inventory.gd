extends Node

var items = []
var selected_item = null

#var key_info = {
	#"name": "Key",
	#"icon_path": "res://Assets/Reception/dummy_key.png"
#}

func add_item(item):
	if item not in items:
		items.append(item)
		
func remove_item(item):
	if item in items:
		items.erase(item)

func has_item(item):
	return item in items
	
func select_item(item):
	selected_item = item
	print("ITEM SELECTED: ")
	print(selected_item)

func clear_selection():
	selected_item = null
	
	

func _ready():
	pass
