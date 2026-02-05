extends Area2D

class_name Catcher

func hoverEffect(o:Draggable):
	pass


func draggedEffect(o:Draggable):
	pass


#function to delete draggable
func deleteDraggable(o:Draggable):
	o.dragging = false
	o.queue_free()
