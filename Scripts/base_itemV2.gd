@tool
extends Control



class_name draggable

@export var sprite:Sprite2D

var dragging:bool

var f:Sprite2D
func _ready() -> void:
	
	
	if sprite.region_enabled == true:
		self.size =sprite.region_rect.size*1.25
		sprite.position = sprite.region_rect.size/2
		
	
	if sprite.region_enabled == false:
		self.size = sprite.get_rect().size *1.25
		sprite.offset = sprite.get_rect().size/2
	

func _process(delta: float) -> void:
	if dragging  == true:
		f.global_position = get_global_mouse_position()
		get_world_2d().direct_space_state
	
	if dragging == false:
		
		if f != null:
			f.free()
			print("fffff")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Lc"):
		print("p")
		#second condition necessary
		
		#need to design better version to adjust for texture sizes.
		
		#further changes to universalize the entire thing. 
		
		#V2 changes are to simplify and set up to just get rect system.
		
		
		if sprite.get_rect().has_point(sprite.to_local(event.position)):
			print("A click!")
			print(3) 
			dragging = true
			f =sprite.duplicate()
			get_tree().root.add_child(f)
			
	if event.is_action_released("Lc"):
		print("r")
		dragging = false
