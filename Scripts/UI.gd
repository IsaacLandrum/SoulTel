extends Control

@onready var Slot1 = $"Inventory/InventoryContainer/Slot1"
@onready var Slot2 = $"Inventory/InventoryContainer2/Slot2"
@onready var Slot3 = $"Inventory/InventoryContainer3/Slot3"

var inventory_slots = []

func _ready():
	# Assuming you have three TextureRect nodes as slots
	inventory_slots.append(Slot1)
	inventory_slots.append(Slot2)
	inventory_slots.append(Slot3)
	update_inventory_ui()

func update_inventory_ui():
	for i in range(inventory_slots.size()):
		if i < Inventory.items.size():
			inventory_slots[i].texture = load(Inventory.items[i].icon_path)  # Assuming each item has an icon_path
		else:
			inventory_slots[i].texture = null
