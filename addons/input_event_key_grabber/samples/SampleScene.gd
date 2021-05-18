# This file is part of InputKeyEvent Grabber, licensed under CC0 1.0
# Project URL: https://github.com/gilzoide/godot-input-key-event-grabber
extends Control

export(ShortCut) var shortcut = preload("res://addons/input_event_key_grabber/samples/change_text_shortcut.tres")

onready var _key_grabber = $HBoxContainer/VBoxContainer/InputEventKeyGrabberButton


func _ready() -> void:
	_key_grabber.event = shortcut.shortcut
	var _err = _key_grabber.connect("event_updated", self, "_on_key_grabber_event_updated")


func _on_key_grabber_event_updated(event: InputEventKey) -> void:
	shortcut.shortcut = event
