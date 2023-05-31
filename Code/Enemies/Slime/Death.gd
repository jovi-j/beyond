extends EnemyState


func enter(msg := {}) -> void:
	enemy.anim_player.play("Death")
	enemy.weapon_hitbox.set_collision_mask_value(4, false)
	
func update(delta) -> void:
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()


func _on_enemy_animations_animation_finished(anim_name):
	if anim_name == "Death":
		enemy.emit_signal("drop_item", enemy.position)
		enemy.queue_free()
