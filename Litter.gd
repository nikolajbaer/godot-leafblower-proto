extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var litter_count = 500
var gravel_template = preload("res://Gravel.tscn")
var leaf_template = preload("res://Leaf.tscn")


func _ready():
	for i in range(litter_count):
		var l
		if randf() > 0.25:
			l = gravel_template.instance()
		else:
			l = leaf_template.instance()
			l.rotation = Vector3(0,randf(),0)
		l.scale *= 1 + rand_range(-.2,.2)
		l.translation = Vector3(rand_range(-50,50),1,rand_range(-50,50))
		self.add_child(l)
	
