extends EnemyState

var flip_count = 0

func enter(_msg:={}):
	if not enemy.player_detection.is_colliding():
		var dir = [Vector2.LEFT, Vector2.RIGHT].pick_random()
		if dir != enemy.enemy_dir:
			enemy.flip()
	
	

func update(delta) -> void:
	if enemy.player_detection.is_colliding():
		state_machine.transition_to("Air", {"do_jump": true})
	
	if enemy.is_on_wall() || not enemy.slope_detection.is_colliding():
		if flip_count == 0:
			flip_count += 1
			enemy.wallbounce_timer.start()
			enemy.flip()
		elif flip_count >= 1 and flip_count < 5 and not enemy.wallbounce_timer.is_stopped():
			flip_count += 1
			enemy.flip()
		elif flip_count >= 5 and not enemy.wallbounce_timer.is_stopped():
			state_machine.transition_to("Air", {"do_jump": true})
		
	enemy.velocity.x = enemy.speed * enemy.enemy_dir.x
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()
	
	



func _on_wallbounce_timer_timeout():
	flip_count = 0
