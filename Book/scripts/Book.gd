extends Node2D

class_name Book

const CHARS : String = 'abcdefghijklmnopqrstuvwxyz'

export(String) var book_code : String

var book_title : String
var base_color : Color
var pages_color : Color
var corner_tips_color : Color
var design_color : Color

onready var label : Label = $Title/Label
onready var sprite_base : Sprite = $Sprite_Base
onready var sprite_design : Sprite = $Sprite_Design
onready var sprite_pages : Sprite = $Sprite_Pages
onready var sprite_cornertips : Sprite = $Sprite_CornerTips

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func _init() -> void:
	randomize()
	book_title = rand_title()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = book_title
	color_book()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rand_title() -> String:
	var length : int = 1 + randi() % 2
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
	pages_color = Color(rand_range(0.85, 1), rand_range(0.85, 1), rand_range(0.85, 1), 1)
	corner_tips_color = Color(rand_range(0.8, 1), rand_range(0.6, 0.9), rand_range(0, 0.2), 1)
	design_color = Color(rand_range(0.2, 0.6), rand_range(0.2, 0.6), rand_range(0.2, 0.6), 1)
	sprite_base.modulate = base_color
	sprite_pages.modulate = pages_color
	sprite_cornertips.modulate = corner_tips_color
	sprite_design.modulate = design_color
