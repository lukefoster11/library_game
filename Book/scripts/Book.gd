extends Node2D

class_name Book

const CHARS : String = 'abcdefghijklmnopqrstuvwxyz'

export(String) var code_prefix : String
export(String) var code : String
export(int) var width : int
export(int) var height : int

var title : String
var base_color : Color
var design_color : Color
var pages_color : Color
var corner_tips_color : Color


onready var spine_base : Sprite = $Spine/Base as Sprite
onready var spine_design : Sprite = $Spine/Design as Sprite
onready var spine_tag : Sprite = $Spine/Tag as Sprite

onready var cover_label : Label = $Cover/Title/Label
onready var cover_base : Sprite = $Cover/Sprite_Base
onready var cover_design : Sprite = $Cover/Sprite_Design
onready var cover_pages : Sprite = $Cover/Sprite_Pages
onready var cover_cornertips : Sprite = $Cover/Sprite_CornerTips

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

func _init() -> void:
	randomize()
	title = rand_title()
	color_book()
	width = 11
	height = 37

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#cover_label.text = book_title
	spine_base.modulate = base_color
	spine_design.modulate = design_color
	spine_tag.modulate = pages_color
	#color_book()


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
	pages_color = Color(rand_range(0.85, 0.92), rand_range(0.85, 1), rand_range(0.85, 1), 1)
	corner_tips_color = Color(rand_range(0.8, 1), rand_range(0.6, 0.9), rand_range(0, 0.2), 1)
	design_color = Color(rand_range(0.2, 0.6), rand_range(0.2, 0.6), rand_range(0.2, 0.6), 1)
	#cover_base.modulate = base_color
	#cover_pages.modulate = pages_color
	#cover_cornertips.modulate = corner_tips_color
	#cover_design.modulate = design_color
	
