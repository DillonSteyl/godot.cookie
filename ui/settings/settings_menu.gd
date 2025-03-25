class_name SettingsMenu
extends Control

@onready var animation_player: AnimationPlayer = $%AnimationPlayer
@onready var apply_button: Button = $%ApplyButton
@onready var back_button: Button = $%BackButton

@onready var display_mode_option_button: OptionButton = $%DisplayModeOptionButton
@onready var volume_slider: HSlider = $%VolumeSlider


func _ready() -> void:
	_load_settings_values()
	apply_button.pressed.connect(_apply_settings)


func open() -> void:
	_load_settings_values()
	animation_player.play("fade_in")
	show()


func _load_settings_values() -> void:
	volume_slider.value = Settings.master_volume
	display_mode_option_button.selected = display_mode_option_button.get_item_index(
		Settings.window_mode
	)


func _apply_settings() -> void:
	# store settings values
	Settings.master_volume = volume_slider.value
	var display_mode = display_mode_option_button.get_selected_id()
	if display_mode >= 0:
		Settings.window_mode = display_mode

	# apply & save to file
	Settings.apply_global_settings()
	Settings.save_to_file()
