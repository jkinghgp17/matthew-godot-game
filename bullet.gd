extends KinematicBody2D

var velocity = Vector2()
var time_to_live = 2.0

func start(pos, vel):
	position = pos
	velocity = vel
	self.set_process(true)
	
func _process(delta):
	if time_to_live <= 0.0:
		queue_free()
	time_to_live -= delta

func _physics_process(delta):
	var collsion = move_and_collide(velocity * delta)