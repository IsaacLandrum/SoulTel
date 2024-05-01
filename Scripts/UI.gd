extends Control

@onready var Slot1 = $"Inventory/InventoryContainer/Slot1"
@onready var Slot2 = $"Inventory/InventoryContainer2/Slot2"
@onready var Slot3 = $"Inventory/InventoryContainer3/Slot3"
@onready var portrait = $"Inventory/portrait container/Sprite2D"

#signals
signal NextDialogue(Ifpushed)

var inventory_slots = []

func _ready():
	# Assuming you have three TextureRect nodes as slots
	if(GameManager.puzzle3.conditions.clothesWorn == true):
		portrait.texture = load("res://Assets/UI/portrait_disguise_cropped.png")
	Inventory.connect("bellhop_worn", _on_bellhop_worn)
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
	if(GameManager.puzzle3.conditions.clothesWorn == true):
		portrait.texture = load("res://Assets/UI/portrait_disguise_cropped.png")

func _on_bellhop_worn():
	portrait.texture = load("res://Assets/UI/portrait_disguise_cropped.png")
	Inventory.remove_item(Inventory.get_selected_item())
	update_inventory_ui()


