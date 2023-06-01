extends CanvasLayer

@onready var question_container : VBoxContainer = $Control/CenterContainer/QuestionContainer
@onready var pause_container: VBoxContainer = $Control/CenterContainer/PauseContainer
var quit_game = false
var goto_menu = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	question_container.visible = false
	question_container.mouse_filter = Control.MOUSE_FILTER_PASS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_sadie_pause_game():
	visible = true
	get_tree().paused = true
	pause_container.mouse_filter = Control.MOUSE_FILTER_STOP
	pause_container.visible = true
	pause_container.get_node("Resume").grab_focus()
	
	
func toggle_container(container):
	var filter = Control.MOUSE_FILTER_PASS if container.mouse_filter == Control.MOUSE_FILTER_STOP else Control.MOUSE_FILTER_PASS
	container.mouse_filter = filter
	container.visible = not container.visible

func deactivate_contaienr(container):
	container.mouse_filter = Control.MOUSE_FILTER_PASS
	container.visible = false

func unpause() -> void:
	deactivate_contaienr(pause_container)
	deactivate_contaienr(question_container)
	visible = false
	get_tree().paused = false

func _on_resume_pressed():
	unpause()

func _on_main_menu_pressed():
	goto_menu = true
	quit_game = false
	toggle_container(pause_container)
	toggle_container(question_container)
	question_container.get_node("HBoxContainer/No").grab_focus()

func _on_quit_game_pressed():
	quit_game = true
	goto_menu = false
	toggle_container(pause_container)
	toggle_container(question_container)
	question_container.get_node("HBoxContainer/No").grab_focus()

func _on_yes_pressed():
	if quit_game:
		get_tree().quit()
	if goto_menu:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://Scenes/Stages/start.tscn")


func _on_no_pressed():
	quit_game = false
	goto_menu = false
	toggle_container(question_container)
	toggle_container(pause_container)
	pause_container.get_node("Resume").grab_focus()
