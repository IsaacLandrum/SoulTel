extends Node

var items = []
var selected_item = null
signal bellhop_worn()

# Example item format

#var key_info = {
	#"name": "Key",
	#"icon_path": "res://Assets/Reception/Key.png"
#}

func add_item(item):
	if item not in items:
		items.append(item)
		
func remove_item(item):
	if item in items:
		items.erase(item)

func has_item(item):
	return item in items

func set_selected_item(item):
	if item in items:
		selected_item = item
		print("Selected item successful: ")
		print(item)
		if(item.name == "Bellhop"):
			GameManager.puzzle3.conditions.clothesWorn = true
			print("clothes worn: ", GameManager.puzzle3.conditions.clothesWorn)
			bellhop_worn.emit()

func get_selected_item():
	print("SELECTED ITEM IS RETURNING: ", selected_item)
	return selected_item

func clear_selected_item():
	print("Cleared selected item: ", selected_item)
	selected_item = null

func check_selected_item(name):
	if(selected_item):
		if(selected_item.name == name):
			return true
	return false

func _ready():
	pass
