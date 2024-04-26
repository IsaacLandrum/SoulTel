extends Node2D

@onready var UI = $Early_UI
@onready var Door_To_Lobby = $Door_To_Lobby
@onready var Zoom = $Desk_Zoom

@onready var Traverse = $"Early_UI/Action Wheel/Traverse"
@onready var Talk = $"Early_UI/Action Wheel/Talk"
@onready var Use = $"Early_UI/Action Wheel/Use"
@onready var Take = $"Early_UI/Action Wheel/Take"
@onready var Examine = $"Early_UI/Action Wheel/Examine"
@onready var Next_label = $"Early_UI/TextBox/TextBoxBackground/RichTextLabel/NextButton"

# Called when the node enters the scene tree for the first time.
func _ready():
	Next_label.visible = false
	GameManager.initRoom2()
	Traverse.connect("action", GameManager._on_room2_action)
	Talk.connect("action", GameManager._on_room2_action)
	Use.connect("action", GameManager._on_room2_action)
	Take.connect("action", GameManager._on_room2_action)
	Examine.connect("action", GameManager._on_room2_action)
