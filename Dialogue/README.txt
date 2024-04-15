RULES FOR DIALOGUE
#1 each room gets it's own file, which will be loaded when you enter the room
#2 each dialogue must be preceeded by a 6-digit ID code: made up of 3 two digit codes
#3 all dialoge must be grouped with their ID on their own, singular, line.
#4 The Dialoge ID will follow this format: (Room ID)-(Character ID)-(Interaction ID)
#5 (Character ID) 00 is reserved for Error text

#from Dialoge readme
#6 each interaction has an assigned dialoge offset
#6.1 Take is assigned the offset of 0.
#6.2 talk is assigned the offset of 1
#6.3 Examine is assigned the offset of 2
#6.4 USE is assigned the offset of 3
#6.5 Traverse is assigned the offset of 4

#7 alternative dialoge has an (Interaction ID) equal to a multiple of five plus it's interaction offset
#7.1 you can find the interaction type by taking the modulo 5 of the (Interaction ID)
