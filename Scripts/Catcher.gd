extends Area2D

class_name catcher

func hoverEffect(o:draggable):
	print("hovered!")
	print("object is" + o.name)


func draggedEffect(o:draggable):
	deleteDraggable(o)
	print("d")

func deleteDraggable(o:draggable):
	o.dragging = false
	o.queue_free()
