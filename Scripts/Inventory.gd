extends Node

var items = []

func add_item(item):
	if item not in items:
		items.append(item)
		
func remove_item(item):
	if item in items:
		items.erase(item)

func has_item(item):
	return item in items

func _ready():
	pass
