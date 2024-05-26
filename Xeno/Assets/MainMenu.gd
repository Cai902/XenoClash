extends Control

signal start_game()
@onready var main_menu = $"Main Menu"
@onready var settings = $Settings
@onready var buttons_v_box = %ButtonsVBox

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()

func toggle():
	visible = !visible
	get_tree().paused = visible


func _on_start_game_pressed() -> void:
	start_game.emit()
	hide()

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_settings_pressed():
	show_and_hide(settings, main_menu)
	
func _on_return_pressed():
	show_and_hide(main_menu, settings)
	
func show_and_hide(first, second):
	first.show()
	second.hide()
	

func _on_music_value_changed(value):
	volume(0, value)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)
	
	
