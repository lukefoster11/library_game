extends KinematicBody2D

export (int) var max_speed = 200

var velocity = Vector2()

func get_input():
	var input = Vector2()
	if Input.is_action_pressed("move_right"):
		input.x += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_down"):
		input.y += 1
	if Input.is_action_pressed("move_up"):
		input.y -= 1
	return input

func _physics_process(delta):
	velocity = get_input().normalized() * max_speed
	velocity = move_and_slide(velocity)
