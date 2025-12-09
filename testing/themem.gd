extends Node
@export var theme: AudioStream
func _ready() -> void:
	aud.change_track(theme)
	#Save.save_game()
	Save.load_game()
	print(Save.save())
