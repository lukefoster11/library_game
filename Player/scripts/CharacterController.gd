extends KinematicBody2D

export (int) var max_speed : int = 50

var velocity : Vector2 = Vector2()
var input : Vector2 = Vector2()

onready var camera : Camera2D = $Camera2D as Camera2D

func _ready() -> void:
	PlayerGlobals.camera = camera

func _physics_process(delta):
	input = Vector2()
	if PlayerGlobals.is_active:
		update_input()
	velocity = input.normalized() * max_speed
	velocity = move_and_slide(velocity)

func update_input():
	if Input.is_action_pressed("move_right"):
		input.x += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_down"):
		input.y += 1
	if Input.is_action_pressed("move_up"):
		input.y -= 1
