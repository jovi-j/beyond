class_name Enemy
extends CharacterBody2D

var enemy_dir = Vector2()
@export var speed : float= 200.0
@export var gravity : float = 3500.0
@export var jump_impulse : float = 1200.0
@export var knockback_impulse : float = 600.0
@export var health : int = 100

@onready var sprite : AnimatedSprite2D = $EnemySprite
@onready var anim_player : AnimationPlayer = $EnemyAnimations
@onready var weapon_hitbox : Area2D = $EnemyWeaponHitbox
@onready var player_detection : RayCast2D = $PlayerDetection
@onready var slope_detection : RayCast2D = $SlopeDetection
@onready var idle_timer : Timer = $Timer
@onready var state_machine : StateMachine = $StateMachine
@onready var invuln_timer : Timer = $InvulnTimer
@onready var wallbounce_timer : Timer = $WallbounceTimer

signal drop_item(position : Vector2)

func _ready():
	up_direction = Vector2.UP

func flip() -> void:
	if enemy_dir == Vector2.LEFT:
		enemy_dir = Vector2.RIGHT
	else:
		enemy_dir = Vector2.LEFT
	sprite.flip_h = enemy_dir == Vector2.LEFT
	slope_detection.position.x *= -1
	player_detection.target_position.x *= -1

func _on_enemy_weapon_hitbox_body_entered(body):
	if body.name == "Sadie":
		body.get_damage(40, enemy_dir)
		
func get_damage(damage : int, direction : Vector2) -> void:
	state_machine.transition_to("Knockback", {"damage":damage, "prev_state":state_machine.state.name, "direction":direction})
