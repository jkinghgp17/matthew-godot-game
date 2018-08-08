extends KinematicBody2D

export (int) var speed = 200
export (int) var bullet_speed = 400

var Bullet = preload('res://bullet.tscn')

var velocity = Vector2()

var bullet_velocity = Vector2()

func get_input():
	velocity = Vector2()
	bullet_velocity = Vector2()
	
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed
	
	if Input.is_action_just_pressed('shoot_right'):
		bullet_velocity.x += 1
	if Input.is_action_just_pressed('shoot_left'):
		bullet_velocity.x -= 1
	if Input.is_action_just_pressed('shoot_down'):
		bullet_velocity.y += 1
	if Input.is_action_just_pressed('shoot_up'):
		bullet_velocity.y -= 1
	bullet_velocity = bullet_velocity.normalized() * bullet_speed

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)
	
	if bullet_velocity.x != 0 || bullet_velocity.y != 0:
		var b = Bullet.instance()
		b.start(global_position,bullet_velocity)
		get_parent().add_child(b)
