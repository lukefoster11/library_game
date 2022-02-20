extends Node2D

export(String) var book_title : String
export(String) var book_code : String

var characters : String = 'abcdefghijklmnopqrstuvwxyz'

onready var label : Label = $Title/Label
onready var sprite_base : Sprite = $Sprite_Base
onready var sprite_design1 : Sprite = $Sprite_Design1

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	book_title = rand_title()
	label.text = book_title


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

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
		word += characters[randi() % 26]
	return word
	
