tool
extends EditorPlugin

const InputEventKeyInspectorPlugin = preload("res://addons/input_event_key_grabber/input_event_key_inspector_plugin.gd")

var _inspector_plugin: EditorInspectorPlugin


func _enter_tree() -> void:
	_inspector_plugin = InputEventKeyInspectorPlugin.new()
	add_inspector_plugin(_inspector_plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(_inspector_plugin)
	_inspector_plugin = null
