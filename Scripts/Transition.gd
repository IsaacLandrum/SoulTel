extends CanvasLayer


func changeMenuScene(target: String) -> void:
	$FadeRect.set_size(Vector2(1152,647))
	$"AnimationPlayer".play("Dissolve")
	await get_tree().create_timer(1.0).timeout
	if _on_animation_player_animation_finished():
		get_tree().change_scene_to_file(target)
		$AnimationPlayer.play_backwards("Dissolve")
		
func changeGameScene(target:String) -> void:
	$FadeRect.set_size(Vector2(917,476))
	$"AnimationPlayer".play("Dissolve")
	SoundManager.play_rand_footstep()
	await get_tree().create_timer(1.0).timeout
	if _on_animation_player_animation_finished():
		get_tree().change_scene_to_file(target)
		$AnimationPlayer.play_backwards("Dissolve")
func changeBG(origin:String,target:String,SceneAnimationPlayer:String) ->void:
	#changes backgrounds of scenes
	get_node(target).set_size(Vector2(917,469))
	get_node(SceneAnimationPlayer).play("Dissolve")
	await get_tree().create_timer(1.0).timeout
	if _on_animation_player_animation_finished():
		get_node(origin).texture=load(target)


func _on_animation_player_animation_finished():
	return true # Replace with function body.
