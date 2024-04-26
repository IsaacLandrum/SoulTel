extends Node




var click_sound_player = AudioStreamPlayer.new()
var title_music = AudioStreamPlayer.new()
var lobby_music = AudioStreamPlayer.new()
var locked_door =AudioStreamPlayer.new()
var error_sfx = AudioStreamPlayer.new()
var unlock_sound = AudioStreamPlayer.new()
var door_jiggle = AudioStreamPlayer.new()
var key_pickup = AudioStreamPlayer.new()
var generic_pickup = AudioStreamPlayer.new()
var footsteps1= AudioStreamPlayer.new()
var footsteps2= AudioStreamPlayer.new()
var footsteps3= AudioStreamPlayer.new()
var longsteps= AudioStreamPlayer.new()

var footsArr=[footsteps1,footsteps2,footsteps3]

func _ready():
	add_child(click_sound_player)
	click_sound_player.stream = preload("res://Assets/Sound/action_select.mp3")
	add_child(title_music)
	title_music.stream = preload("res://Assets/Themes/soultel_title_perchance_demo.mp3")
	add_child(lobby_music)
	lobby_music.stream = preload("res://Assets/Soultel_Lobby_w_Filter.mp3")
	add_child(locked_door)
	locked_door.stream= preload("res://Assets/Sound/locked_door_jiggle.mp3")
	add_child(error_sfx)
	error_sfx.stream = preload('res://Assets/Sound/error_blip.mp3')
	add_child(unlock_sound)
	unlock_sound.stream = preload('res://Assets/Sound/door_unlock.mp3')
	add_child(door_jiggle)
	door_jiggle.stream = preload("res://Assets/Sound/locked_door_jiggle.mp3")
	add_child(key_pickup)
	key_pickup.stream = preload("res://Assets/Sound/key_pickup.mp3")
	add_child(generic_pickup)
	generic_pickup.stream = preload("res://Assets/Sound/generic_item_pickup.mp3")
	add_child(footsteps1)
	footsteps1.stream = preload("res://Assets/Sound/footsteps/footsteps_1.mp3")
	add_child(footsteps2)
	footsteps2.stream = preload("res://Assets/Sound/footsteps/footsteps_2.mp3")
	add_child(footsteps3)
	footsteps3.stream = preload("res://Assets/Sound/footsteps/footsteps_3.mp3")
	add_child(longsteps)
	longsteps.stream = preload("res://Assets/Sound/footsteps/longfootstep.mp3")
	
	
func play_click_sound():
	click_sound_player.play()
func play_title_music():
	title_music.play()
func stop_title_music():
	title_music.stop()
func play_lobby_music():
	lobby_music.play()
func play_locked_door():
	locked_door.play()
func play_error_sfx():
	error_sfx.play()
func play_unlock_door():
	unlock_sound.play()
func play_door_jiggle():
	door_jiggle.play()
func play_key_pickup():
	key_pickup.play()
func play_generic_pickup():
	generic_pickup.play()
func play_rand_footstep():
	var curr_sound = footsArr[randi()% footsArr.size()]
	curr_sound.play()
func play_long_steps():
	longsteps.play()
	
	

