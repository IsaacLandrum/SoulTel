extends Node2D

@onready var Key = $Key
@onready var UI = $Early_UI
@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"

var key_info = {
	"name": "Key",
	"icon_path": "res://Assets/room2/dummy_key.png"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	Traverse.connect("action", _on_action)
	Talk.connect("action", _on_action)
	Use.connect("action", _on_action)
	Take.connect("action", _on_action)
	Examine.connect("action", _on_action)
	
	Key.connect("key_pickup", _on_key_pickup)
	pass # Replace with function body.

func _on_action(action):
	Key.setCurrentAction(action)

func _on_key_pickup():
	Inventory.add_item(key_info)
	UI.update_inventory_ui() # Assuming InventoryUI is the name of the node with the InventoryUI.gd script
	Key.queue_free() # Remove the item from the scene
