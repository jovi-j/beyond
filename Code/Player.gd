class_name Player
extends CharacterBody2D

signal died
signal pause_game
@export var speed : float= 500.0
@export var gravity : float = 3500.0
@export var jump_impulse : float = 1200.0
@export var knockback_impulse : float = 600.00
@export var max_elixirs = 5
@export var elixirs : int = 3
@export var elixir_cure_amount: int = 40
var player_dir = Vector2()

@onready var health : ProgressBar = $CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/HealthBar
@onready var blood : ProgressBar = $CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer2/BloodBar
@onready var sprite : AnimatedSprite2D = $SadieSprite
@onready var anim_player : AnimationPlayer = $SadieAnimPlayer
@onready var weapon_hitbox : CollisionShape2D = $SadieSprite/WeaponHitbox/WeaponCollision
@onready var state_machine : StateMachine = $StateMachine
@onready var invuln_timer : Timer = $InvulnTimer
@onready var elixir_counter : Label = $CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/HBoxContainer2/HBoxContainer/ElixirCounter
@onready var camera : Camera2D =  $CameraLooking/Camera2D

func _ready():
	up_direction = Vector2.UP
	health.value = 100
	blood.value = 0
	update_elixir_counter()
	var tween = get_tree().create_tween()
	tween.tween_property($CameraLooking, "position", Vector2(100,-51), 0.2)

func update_elixir_counter() -> void:
	elixir_counter.text = str(elixirs) + "/" + str(max_elixirs)
	

func _physics_process(_delta):
	if Input.is_action_just_pressed("pause"):
		emit_signal("pause_game")
	if velocity.x < 0:
		player_dir = Vector2.LEFT
		sprite.flip_h = true
		weapon_hitbox.position.x = -70
		$CameraLooking.position.x = -100
	elif velocity.x > 0:
		player_dir = Vector2.RIGHT
		sprite.flip_h = false
		weapon_hitbox.position.x = 70
		$CameraLooking.position.x = 100
	if health.value <= 0:
		NewResource.deaths += 1
		emit_signal("died")
	if Input.is_action_just_pressed("use_elixir"):
		use_elixir()
		
func use_elixir():
	if elixirs > 0:
		change_health(elixir_cure_amount + health.value)
		elixirs -= 1
		update_elixir_counter()
		

func _on_weapon_hitbox_body_entered(body):
	if(body.has_method("get_damage") and body.name != "Sadie"):
		body.get_damage(40, player_dir)
		
func get_blood(amount : int):
	var remain = 0
	if (blood.value + amount) > 100:
		remain = (blood.value + amount) - 100
		blood.value = 100
	if blood.value == 100:
		elixirs = elixirs + 1 if elixirs < max_elixirs else elixirs
		blood.value = 0 + remain
	else:
		blood.value += amount
	update_elixir_counter()
	
func get_damage(damage : int, direction : Vector2) -> void:
	state_machine.transition_to("Knockback", {"damage":damage, "prev_state":state_machine.state.name, "direction": direction})

func change_health(final_health):
	var tween : Tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property(health, "value", final_health, 1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	
