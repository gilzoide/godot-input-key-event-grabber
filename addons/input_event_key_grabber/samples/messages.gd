# This file is part of InputKeyEvent Grabber, licensed under CC0 1.0
# Project URL: https://github.com/gilzoide/godot-input-key-event-grabber
extends Label

export(PoolStringArray) var messages = [
	"Hello world!",
	"Greetings!",
	"Hope you like InputKeyEvent Grabber =]",
	"Such simple and useful functionality",
	"Love it!",
	"(that's why I made it in the first place)",
]
export(ShortCut) var shortcut = preload("res://addons/input_event_key_grabber/samples/change_text_shortcut.tres")

var _current_message = 0


func _ready() -> void:
	text = messages[0]


func _unhandled_input(event: InputEvent) -> void:
	if event.is_pressed() and not event.is_echo() and shortcut.is_shortcut(event):
		change_message()


func change_message() -> void:
	_current_message = (_current_message + 1) % messages.size()
	text = messages[_current_message]
