extends Area2D

class_name Catcher

func hoverEffect(o:Draggable):
	print("hovered!")
	print("object is" + o.name)


func draggedEffect(o:Draggable):
	deleteDraggable(o)
	print("d")

func deleteDraggable(o:Draggable):
	o.dragging = false
	o.queue_free()
