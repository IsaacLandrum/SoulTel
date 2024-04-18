extends Node
@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Room1 = $"GuestRoom1"
@onready var Room2 = $"GuestRoom2"
@onready var Room3 = $"GuestRoom3"
@onready var UI = $"Early_UI"

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.initHallway()
	Traverse.connect("action", GameManager._on_hallway_action)
	Talk.connect("action", GameManager._on_hallway_action)
	Use.connect("action", GameManager._on_hallway_action)
	Take.connect("action", GameManager._on_hallway_action)
	Examine.connect("action", GameManager._on_hallway_action)
	Room1.connect("open_complete", _on_door_open)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_door_open():
	Inventory.remove_item(Inventory.selected_item)
	Inventory.clear_selection()
	UI.update_inventory_ui()
	
	pass
