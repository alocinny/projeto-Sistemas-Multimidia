extends CheckBox

func set_description(text: String):
	self.text = text

func set_completed(is_complete: bool):
	self.button_pressed = is_complete
	pass
