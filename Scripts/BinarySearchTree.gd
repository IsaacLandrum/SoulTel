#@tool

class_name BinarySearchTree
#extends EditorScript
extends Resource

@export var out: BinarySearchTree

var root

#-------------BST NODE START----------#

class BST_Node extends Object:
	var data
	var key
	var lhs
	var rhs
	var parent
	
	func _init(inKey, inData=null, inParent=null, inLHS=null, inRHS=null):
		key = inKey
		lhs = inLHS
		rhs = inRHS
		parent = inParent
		data = inData
	
	func _to_string():
		return data

#--------------BST NODE END----------#
func _init(in_root=null):
	root = in_root

#insert a new element into the tree
func insert(key, inData):
	var checker = root
	var ahead = null
	if(checker == null):
		root = BST_Node.new(key, inData)
		return
	
	if(key < checker.key):
		ahead = checker.lhs

	if(key > checker.key):
		ahead = checker.rhs

	while(ahead != null):
		checker = ahead
		if(key < checker.key):
			ahead = checker.lhs

		if(key > checker.key):
			ahead = checker.rhs
		
		if(key == checker.key):
			return

	if(key < checker.key):
		checker.lhs = BST_Node.new(key, inData, checker)

	if(key > checker.key):
		checker.rhs = BST_Node.new(key, inData, checker)

	return

func InSearch(key):
	var checker = root

	while((checker != null) and (checker.key != key)):
		if(key < checker.key):
			checker = checker.lhs
		elif(key > checker.key):
			checker = checker.rhs
	
	return checker

func Search(key):
	var checker = root

	while((checker != null) and (checker.key != key)):
		if(key < checker.key):
			checker = checker.lhs
		elif(key > checker.key):
			checker = checker.rhs
	
	if(checker==null):
		return null
	
	return checker.data

func minnimumElement():
	var checker = root

	if(checker == null):
		return "error"

	while(checker.lhs != null):
		checker = checker.lhs
	
	return checker

func maximumElement():
	var checker = root

	if(checker == null):
		return "error1"

	while(checker.rhs != null):
		checker = checker.rhs
	
	return checker

func internalMaximumElement(node):
	var checker = node

	if(checker == null):
		return "error1"

	while(checker.rhs != null):
		checker = checker.rhs
	
	return checker

#returns next node for in order traversal
func Successor(currentNode):
	var checker = currentNode
	if(checker == null):
		return "Error2"
	var ahead = checker.parent

	#if no right hand child, go up the tree until this node is on the left hand side
	if(checker.rhs == null):
		while((ahead != null) and (ahead.rhs == checker)):
			checker = ahead
			ahead = ahead.parent
		
		if(ahead == null):
			return null
		#up one more to reach parent
		checker = ahead
	#if it has a right hand child, go to bottom left
	else:
		checker = currentNode.rhs
		while(checker.lhs != null):
			checker = checker.lhs
	
	return checker


func Predecessor(currentNode):
	var checker = currentNode
	if(checker == null):
		return "Error3"
	var ahead = checker.parent

	#if no left hand child, go up the tree until this node is on the right hand side
	if(checker.lhs == null):
		while((ahead != null) and (ahead.lhs == checker)):
			checker = ahead
			ahead = ahead.parent
		
		if(ahead == null):
			return null
		#up one more to reach parent
		checker = ahead
	#if it has a right hand child, go to bottom left
	else:
		checker = currentNode.lhs
		while(checker.lhs != null):
			checker = checker.rhs

	return checker

func traverse():
	var output = []
	var mover = minnimumElement()

	while(mover != null):
		output.append(mover.data)
		mover = Successor(mover)

	return output

func delete(key):
	var marker = InSearch(key)
	
	if(marker.lhs==null and marker.rhs==null):
		if(marker.parent.lhs == marker):
			marker.parent.lhs = null
		else:
			marker.parent.rhs = null
	elif(marker.lhs!=null and marker.rhs==null):
		marker.rhs.parent = marker.parent
		if(marker.parent.lhs == marker):
			marker.parent.lhs = marker.rhs
		else:
			marker.parent.rhs = marker.rhs
	elif(marker.lhs==null and marker.rhs!=null):
		marker.rhs.parent = marker.parent
		if(marker.parent.lhs == marker):
			marker.parent.lhs = marker.rhs
		else:
			marker.parent.rhs = marker.rhs
	else:
		marker.lhs.parent = marker.parent
		marker.rhs.parent = internalMaximumElement(marker.lhs)
		marker.rhs.parent.rhs = marker.rhs
		
		if(marker.parent.lhs == marker):
			marker.parent.lhs = marker.lhs
		else:
			marker.parent.rhs = marker.lhs
	
	marker.free()
	
func clear(deleter=root, start=true):
	if(deleter==null):
		return
	if(deleter.lhs != null):
		clear(deleter.lhs, false)
	if(deleter.rhs != null):
		clear(deleter.rhs, false)
	deleter.free()
	
	if(start):
		root=null

#---------------testing----------------
func _run():
	#Binary Search Tree part 1
	#the example from class
	var Class_Tree1 = BinarySearchTree.new()
	print("Testing the tree given in class:")
	print("Unsorted list: ")
	var class_list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11] #11
	var class_list2 = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
	print(class_list1)
	print("Now constructing tree:")
	var i = 0
	while(i < len(class_list1)):
		Class_Tree1.insert(class_list1[i], class_list2[i])
		i = i+1
	print("in order walk: ")
	print(Class_Tree1.traverse())
	print("Minnimum Element: ")
	print(Class_Tree1.minnimumElement())
	print("Maximmum Element: ")
	print(Class_Tree1.maximumElement())
	print("Successor of Node with key 6: ")
	print(Class_Tree1.Successor(Class_Tree1.InSearch(6)))
	print("\n")

	#the example for homework example
	var Home_Tree1 = BinarySearchTree.new()
	print("Testing the tree given in Homework:")
	print("Unsorted list: ")
	var home_list1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	var home_list2 = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l"]
	print(home_list1)
	print("Now constructing tree:")
	i = 0
	while(i < len(home_list1)):
		Home_Tree1.insert(home_list1[i], home_list2[i])
		i = i+1
	print("in order walk: ")
	print(Home_Tree1.traverse())
	print("Minnimum Element: ")
	print(Home_Tree1.minnimumElement())
	print("Maximmum Element: ")
	print(Home_Tree1.maximumElement())
	print("Predecessor of Node with key 5: ")
	print(Home_Tree1.Predecessor(Home_Tree1.InSearch(5)))
	print((Home_Tree1.InSearch(5)).parent)
	print("\n")
