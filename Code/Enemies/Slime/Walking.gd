extends EnemyState



func update(delta) -> void:
	# o player detection só detecta colisões na layer 4
#	if enemy.player_detection.is_colliding():
#		state_machine.transition_to("Attack")

	if not enemy.slope_detection.is_colliding() || enemy.is_on_wall():
		enemy.flip()

	enemy.velocity.x = enemy.speed * enemy.enemy_dir.x
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()

