class_name Main
extends Node

const MAIN_MENU_SCENE = preload("res://ui/main_menu/main_menu.tscn")

@onready var world: Node2D = $World
@onready var ui: Control = $UI


func _ready() -> void:
	go_to_menu()


func go_to_menu() -> void:
	set_world(null)

	var main_menu: MainMenu = MAIN_MENU_SCENE.instantiate()
	set_ui(main_menu)


func set_ui(ui_node: Control) -> void:
	for child in ui.get_children():
		child.queue_free()

	if ui_node:
		ui.add_child(ui_node)


func set_world(world_node: Node2D) -> void:
	for child in world.get_children():
		child.queue_free()

	if world_node:
		world.add_child(world_node)
