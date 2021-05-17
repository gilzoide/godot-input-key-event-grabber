# This file is part of InputKeyEvent Grabber, licensed under CC0 1.0
# Project URL: https://github.com/gilzoide/godot-input-key-event-grabber
extends Button

signal event_cleared()
signal event_updated(event)

export(String) var empty_event_text = "Press a key..."

var event: InputEventKey = null setget set_event


func _ready() -> void:
	set_event(null)


func _pressed() -> void:
	grab_focus()


func _gui_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and not event.is_echo():
			set_event(event)
			if not event_is_modifier(event):
				var next = get_node_or_null(focus_next)
				if next is Control:
					next.grab_focus()
				else:
					release_focus()
		accept_event()



func set_event(value: InputEventKey) -> void:
	event = value
	if event == null:
		text = empty_event_text
		emit_signal("event_cleared")
	else:
		text = event.as_text()
		emit_signal("event_updated", event)


static func event_is_modifier(event: InputEventKey):
	return event.scancode in [KEY_ALT, KEY_CONTROL, KEY_META, KEY_SHIFT]
