extends Node
@export var theme: AudioStream
func _ready() -> void:
	aud.change_track(theme)
	Save.load_game()
	print(Save.save())
