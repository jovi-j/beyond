extends PlayerState


func enter(msg := {}) -> void:
	if player.invuln_timer.is_stopped():
		player.velocity.x += (player.velocity.normalized().x * -1) + 2 * player.knockback_impulse
		player.velocity.y -= (player.velocity.normalized().y * -1) + 1 * player.knockback_impulse
		var tween : Tween = get_tree().create_tween().set_parallel(true)
		player.change_health(player.health.value - msg['damage'])
		tween.tween_property(player,"modulate:v", 1, 0.2).from(15) 
		player.invuln_timer.start()
		state_machine.transition_to("Air")
	else:
		state_machine.transition_to(msg["prev_state"])

