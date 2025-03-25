class_name MainMenu
extends Control

@onready var main_vbox: VBoxContainer = $VBoxContainer

@onready var play_button: Button = $%PlayButton
@onready var settings_button: Button = $%SettingsButton
@onready var exit_button: Button = $%ExitButton

@onready var settings_menu: SettingsMenu = $%SettingsMenu
@onready var animation_player: AnimationPlayer = $%AnimationPlayer


func _ready() -> void:
	animation_player.play("fade_in")

	exit_button.pressed.connect(get_tree().quit)

	settings_button.pressed.connect(show_settings)
	settings_menu.back_button.pressed.connect(show_main)


func show_settings() -> void:
	main_vbox.hide()
	settings_menu.open()


func show_main() -> void:
	settings_menu.hide()
	animation_player.play("fade_in")
	main_vbox.show()
