extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var LITTER_CNT = 100
var gravel_template = preload("res://Gravel.tscn")
#var leaf_template = preload("res://Leaf.tscn")


func _ready():
	for i in range(LITTER_CNT):
		var l = gravel_template.instance()
		l.scale *= .2 + rand_range(-.1,.1)
		l.translation = Vector3(rand_range(-50,50),1,rand_range(-50,50))
		self.add_child(l)
	
