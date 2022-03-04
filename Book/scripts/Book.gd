class_name Book
extends Node2D

const CHARS : String = 'abcdefghijklmnopqrstuvwxyz'
const SPINES11x37 : Array = [preload("res://Book/scenes/spines/11x37Spine1.tscn")]
const SPINES14x26 : Array = [preload("res://Book/scenes/spines/14x26Spine1.tscn")]

export(String) var code_prefix : String
export(float) var code_number: float

var title : String
var dimensions : Vector2

var base_color : Color
var design_color : Color
var pages_color : Color
var corner_tips_color : Color

var Spine : PackedScene
var spine_base : Sprite
var spine_design : Sprite
var spine_tag : Sprite

func _init() -> void:
	rand_seed(5)
	title = rand_title()
	color_book()
	dimensions = rand_dimensions()
	Spine = rand_spine()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spine : Node2D = Spine.instance()
	add_child(spine)
	spine.name = "Spine"
	
	spine_base = $Spine/Base as Sprite
	spine_design = $Spine/Design as Sprite
	spine_tag = $Spine/Tag as Sprite
	
	spine_base.modulate = base_color
	spine_design.modulate = design_color
	spine_tag.modulate = pages_color


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rand_title() -> String:
	var length : int = 1 + randi() % 3
	var title : String
	for i in range(length):
		title += rand_word() + " "
	return title

func rand_word() -> String:
	var length : int = 6 + randi() % 6
	var word : String
	for i in range(length):
		word += CHARS[randi() % len(CHARS)]
	return word
	
func color_book() -> void:
	base_color = Color(rand_range(0.2, 0.8), rand_range(0.2, 0.8), rand_range(0.2, 0.8), 1)
	pages_color = Color(rand_range(0.85, 0.92), rand_range(0.85, 1), rand_range(0.85, 1), 1)
	corner_tips_color = Color(rand_range(0.8, 1), rand_range(0.6, 0.9), rand_range(0, 0.2), 1)
	design_color = Color(rand_range(0.2, 0.6), rand_range(0.2, 0.6), rand_range(0.2, 0.6), 1)

func rand_dimensions() -> Vector2:
	var num : int = randi()
	if num % 2:
		return Vector2(11, 37)
	else:
		return Vector2(14, 26)

func rand_spine() -> PackedScene:
	if dimensions == Vector2(11, 37):
		return SPINES11x37[randi() % len(SPINES11x37) - 1]
	if dimensions == Vector2(14, 26):
		return SPINES14x26[randi() % len(SPINES14x26) - 1]
	else:
		 return null
