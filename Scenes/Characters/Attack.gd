extends PlayerState

func enter(_msg := {}) -> void:
	player.anim_player.play("Attack")

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return

	var input_direction_x: float = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
		)
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.gravity * delta
	player.move_and_slide()

func _on_sadie_anim_player_animation_finished(anim_name):
	if anim_name == "Attack":
		if player.velocity.x != 0 and player.is_on_floor():
			state_machine.transition_to("Run")
			return
		elif not player.is_on_floor():
			state_machine.transition_to("Air")
			return
		state_machine.transition_to("Idle")
