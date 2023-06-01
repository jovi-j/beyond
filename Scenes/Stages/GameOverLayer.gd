extends CanvasLayer




func _on_animation_player_animation_finished(_anim_name):
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Stages/cutscene.tscn")


func _on_sadie_died():
	get_tree().paused = true
	$AnimationPlayer.play("Game_over")
