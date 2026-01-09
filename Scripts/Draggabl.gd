extends Area2D


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Lc"):
		print("p")
		#second condition necessary
	if event.is_action_released("Lc"):
		print("r")
