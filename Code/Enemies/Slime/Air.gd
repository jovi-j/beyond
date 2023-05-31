extends EnemyState


func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		enemy.anim_player.play("Jump_charge")

func update(delta):
	if enemy.anim_player.current_animation != "Jump_charge":
		enemy.velocity.y += enemy.gravity * delta
		enemy.move_and_slide()

		if enemy.velocity.y < 0:
			enemy.anim_player.play("Jump_up")
		if enemy.velocity.y > 0:
			enemy.anim_player.play("Jump_down")

		if enemy.is_on_floor():
			enemy.anim_player.play("Jump_finish")

func _on_enemy_animations_animation_finished(anim_name:StringName):
	if anim_name == "Jump_charge":
		enemy.anim_player.play("Jump_up")
		enemy.velocity.y = -1200.0
		enemy.velocity.x = 300 * enemy.enemy_dir.x
	elif anim_name == "Jump_up":
		enemy.anim_player.play("Jump_down")
	elif anim_name == "Jump_down":
		enemy.anim_player.play("Jump_finish")
	elif anim_name == "Jump_finish":
		if enemy.health <= 0:
			state_machine.transition_to("Death")
		state_machine.transition_to("Idle")


	

