extends CanvasLayer

#Dialoge holder
var Rm_dialoge = []

#the filepath constants and variables
const filePath1 = "res://Dialogue/Room_"
var filePath2 = "00"
const filePath3 = ".txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#loads the dialogue for the room and puts it in a binary tree
#called every time the room changes
func Load_Room_Dialogue(roomID):
	Rm_dialoge.clear()
	filePath2 = (roomID as String)
	var Input_path = filePath1 + filePath2 + filePath3
	var FileReader = FileAccess.open(Input_path, FileAccess.READ)
	

#changes the dipslayed dialogue in the text-box
func change_displayed_dialogue(newText):
	pass

#handles the text
func Dialoge_handler():
	pass
