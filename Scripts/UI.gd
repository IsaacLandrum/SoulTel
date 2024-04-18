extends Control

@onready var Slot1 = $"Inventory/InventoryContainer/Slot1"
@onready var Slot2 = $"Inventory/InventoryContainer2/Slot2"
@onready var Slot3 = $"Inventory/InventoryContainer3/Slot3"
@onready var Traverse = $"Action Wheel/Traverse"
@onready var Talk = $"Action Wheel/Talk"
@onready var Take = $"Action Wheel/Take"
@onready var Examine = $"Action Wheel/Examine"
@onready var Use = $"Action Wheel/Use"
@onready var container1 = $"Inventory/InventoryContainer"
@onready var container2 = $"Inventory/InventoryContainer2"
@onready var container3 = $"Inventory/InventoryContainer3"

var inventory_slots = []
var target_slot = null
var use_selected = false

func _ready():
	# Assuming you have three TextureRect nodes as slots
	inventory_slots.append(Slot1)
	inventory_slots.append(Slot2)
	inventory_slots.append(Slot3)
	
	container1.connect("container", _on_container_selected)
	container2.connect("container", _on_container_selected)
	container3.connect("container", _on_container_selected)
	
	Traverse.connect("action", _on_action)
	Talk.connect("action", _on_action)
	Use.connect("action", _on_action)
	Take.connect("action", _on_action)
	Examine.connect("action", _on_action)
	
	update_inventory_ui()

func update_inventory_ui():
	for i in range(inventory_slots.size()):
		if i < Inventory.items.size():
			inventory_slots[i].texture = load(Inventory.items[i].icon_path)  # Assuming each item has an icon_path
		else:
			inventory_slots[i].texture = null
			
func _on_action(message: String):
	if message == "USE":
		use_selected = true
		print("Use selected from UI")
	else:
		use_selected = false
		Inventory.clear_selection()
		print("Non use selected")

#var key_info = {
	#"name": "Key",
	#"icon_path": "res://Assets/Reception/dummy_key.png"
#}

func _on_container_selected(number: int):
	if use_selected:
		if number == 1:
			Inventory.select_item(Inventory.items[0])
			print ("Container 1 from UI")
		elif number == 2:
			Inventory.select_item(Inventory.items[1])
			print ("Container 2 from UI")
		elif number == 3:
			Inventory.select_item(Inventory.items[2])
			print ("Container 3 from UI")	
	
