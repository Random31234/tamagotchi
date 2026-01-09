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
		
		
		var w = get_world_2d().direct_space_state
		var f = get_global_mouse_position()
		var z = PhysicsPointQueryParameters2D.new()
		z.collide_with_areas = true
		z.position = f
		print(z.collide_with_areas)
		if w.intersect_point(z).size()>0:
			print(w.intersect_point(z)[0].collider.get_child_count())
		#system in place for detecting the area 2d, now a function is needed to then determine what exactly we are "detecting"
		
	
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
