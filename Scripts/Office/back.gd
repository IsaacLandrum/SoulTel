extends "res://Scripts/interactable.gd"


func interact():
	if (currentAction == "TAKE"):
		pass # TAKE
	elif (currentAction == "TALK"):
		pass # TALK
	elif (currentAction == "EXAMINE"):
		
		pass # examine
	elif (currentAction == "USE"):
		pass
		
		pass # USE
	elif (currentAction == "TRAVERSE" && canTraverse):
		print("trav")
		get_tree().change_scene_to_file(traverse_path)
