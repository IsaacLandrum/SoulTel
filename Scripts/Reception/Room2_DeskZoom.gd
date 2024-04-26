extends Node2D

@onready var Key = $Key
@onready var UI = $Early_UI
@onready var Bell = $Bell
@onready var Clerk = $Clerk
@onready var Background = $Background

@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Next_label = $"Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"

var key_taken = false # Protects from sending action to Key if it has been freed

var key_info = {
	"name": "Key",
	"icon_path": "res://Assets/Reception/Key.png"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	Next_label.visible =false
	GameManager.initRoom2DeskZoom()
	Traverse.connect("action", GameManager._on_room2_deskzoom_action)
	Talk.connect("action", GameManager._on_room2_deskzoom_action)
	Use.connect("action", GameManager._on_room2_deskzoom_action)
	Take.connect("action", GameManager._on_room2_deskzoom_action)
	Examine.connect("action", GameManager._on_room2_deskzoom_action)

	Key.connect("key_pickup", _on_key_pickup)
	Bell.connect("bell_rung", _on_bell_rung)
	Clerk.connect("clerk_talk", _on_clerk_talk)
	
	Clerk.visible = false
	Key.visible = false

func _on_key_pickup():
	Inventory.add_item(key_info)
	SoundManager.play_key_pickup()
	UI.update_inventory_ui() # Assuming InventoryUI is the name of the node with the InventoryUI.gd script
	Key.queue_free() # Remove the item from the scene
	GameManager._on_puzzle2_keyPickup()

func _on_bell_rung():
	ChangeDeskClerk("res://Assets/Reception/deskzoominlinesclerk.png")
	Clerk.visible = true

func _on_clerk_talk():
	if(!GameManager.puzzle2.conditions.keyTaken):
		Key.visible = true
	
func _on_color_rect_mouse_exited():
	pass # Replace with function body.
	
func ChangeDeskClerk(target:String)-> void:
	$"AnimationPlayer/CanvasLayer/BGClerk".set_size(Vector2(917,469))
	$"AnimationPlayer".play("Dissolve")
	await get_tree().create_timer(1.0).timeout
	if _on_animation_player_animation_finished():
		Background.texture=load(target)
		$"AnimationPlayer/CanvasLayer/BGClerk".visible = false
		
		
		
func _on_animation_player_animation_finished():
	return true
