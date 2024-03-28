extends CanvasLayer

#Dialoge holder
#var dialogueTree_Blueprint
var dialogueTree
var display
var sigSender
var debug#---------------------------------------------------------delete this

#the filepath constants and variables
const filePath1 = "res://Dialogue/Room_"
var filePath2 = "00"
const filePath3 = ".txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	const dialogueTree_Blueprint = preload("res://Scripts/BinarySearchTree.gd")
	dialogueTree = dialogueTree_Blueprint.new()
	display = get_node("MarginContainer/MarginContainer2/Label")
	sigSender = get_node("/root/Node2D/Interactable")
	sigSender.connect("DialogOut", change_displayed_dialogue)
	debug = "00"
	Load_Room_Dialogue(debug)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#loads the dialogue for the room and puts it in a binary tree
#called every time the room changes
func Load_Room_Dialogue(roomID):
	dialogueTree.clear()
	filePath2 = (roomID as String)
	var Input_path = filePath1 + filePath2 + filePath3
	var content = []
	var FileReader = FileAccess.open(Input_path, FileAccess.READ)
	while FileReader.get_position() < FileReader.get_length():
		content.append(FileReader.get_line())
	FileReader.close()
	
	#all content stored in content. now parse
	var treeKey = null
	var treeData = null
	var i = 0
	while(i < content.size()):
		treeKey = (content[i].left(6)).to_int()
		treeData = content[i].right(-7)
		dialogueTree.insert(treeKey, treeData)
		i+=1

#changes the dipslayed dialogue in the text-box
func change_displayed_dialogue(newKey):
	var ID = filePath2+newKey+"00"
	var newDialoge = dialogueTree.Search(ID.to_int())
	display.text = newDialoge

#handles the text
func Dialoge_handler():
	pass
