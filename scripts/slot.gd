extends Panel

@export var item : TilesResource = null:
	set(value):
		item = value
		
		if value == null: 
			$Icon.texture = null
			$Amount.text = ""
			return
			
		$Icon.texture = value.icon # if its not null then set the icon 
		
@export var amount : int = 0: 
	set(value):
		amount = value 
		$Amount.text = str(value)
		if amount <= 0:
			item = null
			
func set_amount(value : int):
	amount = value
	
func add_amount(value : int): 
	amount += value
	
func _can_drop_data(_at_position, data):
	if "item" in data:
		return is_instance_of(data.item, TilesResource)
	return false
	
func _drop_data(_at_position, data):
	var temp = item
	item = data.item
	data.item = temp 
	
	temp = amount 
	amount = data.amount
	data.amount = temp
	
func _get_drag_data(_at_position):
	if item: 
		var preview_texture = TextureRect.new()
		
		preview_texture.texture = item.icon
		preview_texture.size = Vector2(54,54)
		preview_texture.position = -Vector2(20,20)
		
		var preview = Control.new()
		preview.add_child(preview_texture)
		set_drag_preview(preview)
		
	return self
