extends KinematicBody2D

export (int) var max_speed : int = 200

var velocity : Vector2 = Vector2()
var input : Vector2 = Vector2()

func update_input():
	if Input.is_action_pressed("move_right"):
		input.x += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_down"):
		input.y += 1
	if Input.is_action_pressed("move_up"):
		input.y -= 1

func _physics_process(delta):
	input = Vector2()
	if PlayerGlobals.is_active:
		update_input()
	velocity = input.normalized() * max_speed
	velocity = move_and_slide(velocity)
