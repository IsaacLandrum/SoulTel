extends Node
@onready var UI = $Early_UI

@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"

@onready var Background = $"TextureRect"
@onready var Ghost = $"CanvasLayer2/Ghost"
@onready var Paper = $"CanvasLayer2/Paper"

@onready var LetterText = $"CanvasLayer/RichTextLabel"

var paper_info = {
	"name": "Paper",
	"icon_path": "res://Assets/RoomsHallway/GuestRoom1/paper empty.png"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.initGuestRoom1()
	Traverse.connect("action", GameManager._on_guestroom1_action)
	Talk.connect("action", GameManager._on_guestroom1_action)
	Use.connect("action", GameManager._on_guestroom1_action)
	Take.connect("action", GameManager._on_guestroom1_action)
	Examine.connect("action", GameManager._on_guestroom1_action)
	
	Ghost.connect("ghost_talked", ghost_talked)
	Paper.connect("paper_pickup", paper_pickup)
	Ghost.connect("paper_returned", paper_returned)
	
	LetterText.visible = false

func paper_pickup():
	Inventory.add_item(paper_info)
	UI.update_inventory_ui()
	Paper.queue_free()
	Background.texture = load("res://Assets/RoomsHallway/GuestRoom1/guest_room_lines color.png")
	GameManager._on_puzzle3_paperPickup()

func ghost_talked():
	Ghost.queue_free()
	Background.texture = load("res://Assets/RoomsHallway/GuestRoom1/guestroom(paper).png")
	GameManager._on_puzzle3_ghost_talked()

func paper_returned():
	LetterText.visible = true
