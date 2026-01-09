extends Sprite2D


var moving:bool = false

func _process(delta: float) -> void:
	if moving == true:
		self.global_position = get_global_mouse_position()
