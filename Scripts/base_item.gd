extends Control


@export var sprite:Sprite2D

var dragging:bool

var f:Sprite2D
func _ready() -> void:
	pass
	

func _process(delta: float) -> void:
	if dragging  == true:
		f.global_position = get_global_mouse_position()
	
	if dragging == false:
		
		if f != null:
			f.free()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Lc"):
		print("p")
		#second condition necessary
		
		#need to design better version to adjust for texture sizes.
		
		#further changes to universalize the entire thing. 
		
		var mx = get_global_mouse_position().x
		var my = get_global_mouse_position().y
		
		print(sprite.texture.get_height())
		print (sprite.texture.get_width())
		
		
		var ix = global_position.x +16
		var iy = global_position.y +16
		
		if ix - mx > -16 && ix -mx <16:
			if iy - my > -16 && iy -my <16:
				print(3) 
				dragging = true
				f =sprite.duplicate()
				get_tree().root.add_child(f)
				
	if event.is_action_released("Lc"):
		print("r")
		dragging = false
