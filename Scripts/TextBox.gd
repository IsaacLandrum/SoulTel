extends CanvasLayer

#Dialoge holder
#var dialogueTree_Blueprint
var dialogueTree
var display
var sigReciever

#the filepath constants and variables
const filePath1 = "res://Dialogue/Room_"
var filePath2 = "00"
const filePath3 = ".txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	var Room_Scene = get_node("/root/Node2D")
	var Room_data
	const dialogueTree_Blueprint = preload("res://Scripts/BinarySearchTree.gd")
	dialogueTree = dialogueTree_Blueprint.new()
	display = get_node("TextBoxBackground/RichTextLabel")
	sigReciever = get_tree().get_nodes_in_group("Interactable")
	if(sigReciever != null):
		for connect in sigReciever:
			connect.connect("DialogOut", change_displayed_dialogue)
	else:
		print("sigreciever is null")
	if(Room_Scene != null):
		Room_data = Room_Scene.get_meta("Room_Number")
		if(Room_data != null):
			Load_Room_Dialogue(Room_data)

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
func change_displayed_dialogue(CharacterID, InteractionID):
	print("change display dialogue")
	var ID = filePath2+CharacterID+InteractionID
	var newDialoge = dialogueTree.Search(ID.to_int())
	if(newDialoge == null):
		newDialoge = "error, dialoge is Null"
	display.text = newDialoge
	print("Text change")
