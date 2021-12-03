extends Area

var strength = 5
var ground_effect = 0.1
var collide
var target

# Called when the node enters the scene tree for the first time.
func _ready():
	collide = $PlumeCollider
	target = $Target

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var aim_v = target.global_transform.origin - self.global_transform.origin
	if Input.is_action_pressed("blow"):
		for b in self.get_overlapping_bodies():
			if b is StaticBody: continue
			
			var to = b.global_transform.origin - self.global_transform.origin
			var d = to.length()
			var a = to.angle_to(aim_v)
			
			var p = min(1/d,1) * min(1/a,1)
			
			
			var f = to.normalized() * strength * p
			
			var bheight = b.global_transform.origin.y
			f.y = ground_effect * 1/pow(bheight,2)* p
			
			b.apply_central_impulse(f)
			#b.apply_central_impulse(Vector3(0,strength,0))
		
