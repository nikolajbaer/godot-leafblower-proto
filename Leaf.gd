extends RigidBody

var C = 0.00005


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not self.sleeping:
		var v = self.linear_velocity.normalized()
		var vm = self.linear_velocity.length_squared()
		self.apply_central_impulse(v * -vm * C)
