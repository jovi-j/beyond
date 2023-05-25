extends PlayerState

func enter(_msg := {}) -> void:
	player.anim_player.play("attack")


func _on_sadie_anim_player_animation_finished(anim_name):
	if(anim_name == "attack"):
		if player.velocity.x == 0 and player.is_on_floor():
			state_machine.transition_to("Idle")
		elif player.velocity.x != 0 and player.is_on_floor():
			state_machine.transition_to("Run")
		elif not player.is_on_floor():
			state_machine.transition_to("Air")
	else:
		state_machine.transition_to("Idle")
