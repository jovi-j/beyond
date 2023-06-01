extends EnemyState

func enter(_msg := {}) -> void:
	enemy.velocity = Vector2.ZERO
	enemy.anim_player.play("Idle")
	enemy.idle_timer.start()



func _on_timer_timeout():
	if enemy.health > 0:
		state_machine.transition_to("Walking")
