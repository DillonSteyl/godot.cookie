extends Node

const FILEPATH = "user://settings.cfg"

const SECTION_NAME = "UserSettings"
const SAVED_ATTRIBUTES = ["master_volume", "window_mode"]

var master_volume: float = 1.0
var window_mode: int = DisplayServer.WindowMode.WINDOW_MODE_WINDOWED

@onready var config = ConfigFile.new()


func _ready() -> void:
	load_from_file()


func save_to_file() -> void:
	for attr in SAVED_ATTRIBUTES:
		config.set_value(SECTION_NAME, attr, get(attr))

	config.save(FILEPATH)


func load_from_file() -> void:
	var err = config.load(FILEPATH)
	if err != OK:
		push_warning("Failed to load settings - error code " + str(err))
		return

	for attr in SAVED_ATTRIBUTES:
		var saved_value = config.get_value(SECTION_NAME, attr, get(attr))
		set(attr, saved_value)

	apply_global_settings()


## Applies the loaded settings globally where appropriate (e.g. audio settings, display modes, etc)
func apply_global_settings() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(master_volume))
	DisplayServer.window_set_mode(window_mode)


func _exit_tree() -> void:
	save_to_file()
