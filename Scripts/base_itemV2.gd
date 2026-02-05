extends Control



class_name Draggable

@export var sprite:Sprite2D
var apply_once:bool
var dragging:bool

@export var spritem:PackedFloat32Array = [0,0,1,0.5,0]

var f:Sprite2D
func _ready() -> void:
	
	
	if sprite.region_enabled == true:
		self.size =sprite.region_rect.size*1.25
		sprite.offset = sprite.region_rect.size/2
		
	
	if sprite.region_enabled == false:
		self.size = sprite.get_rect().size *1.25
		sprite.offset = sprite.get_rect().size/2
	

func _process(_delta: float) -> void:
	if dragging  == true:
		f.global_position = get_global_mouse_position()
		f.global_position = f.global_position -sprite.get_rect().size/2
		
		var w = get_world_2d().direct_space_state
		var g = get_global_mouse_position()
		var z = PhysicsPointQueryParameters2D.new()
		z.collide_with_areas = true
		z.position = g
		print(z.collide_with_areas)
		if w.intersect_point(z).size()>0:
			for b in w.intersect_point(z):
				if b.collider is Catcher:
					triggerHover(b.collider) 
		#system in place for detecting the area 2d, now a function is needed to then determine what exactly we are "detecting"
		
	

func spritemodifier():
	if f !=null:
		#defaults to hsv
		var c:Color
		c = Color.from_hsv(spritem[0],spritem[1],spritem[2],spritem[3])
		#function to go by rbg instead.
		if spritem[4] >0:
			c = Color(spritem[0],spritem[1],spritem[2],spritem[3])
		
		f.modulate= c

func updateSprite(s:Sprite2D):
	if f != null:
		f = s

func triggerHover(c:Catcher):
	c.hoverEffect(self)
	

func triggerDrag(c:Catcher):
	c.draggedEffect(self)

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
			spritemodifier()
			
	if event.is_action_released("Lc"):
		print("r")
		var w = get_world_2d().direct_space_state
		var g = get_global_mouse_position()
		var z = PhysicsPointQueryParameters2D.new()
		z.collide_with_areas = true
		z.position = g
		print(z.collide_with_areas)
		if f != null:
			f.free()
		
		if w.intersect_point(z).size()>0:
			for b in w.intersect_point(z):
				if b.collider is Catcher:
					triggerDrag(b.collider)
					
		dragging = false
