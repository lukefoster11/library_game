extends Node2D
class_name Shelf

const Book = preload("res://Book/scenes/Book.tscn")

export (String) var code_prefix : String = ""
export (Vector2) var code_bounds : Vector2

var books : Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	write_books(code_prefix, code_bounds)
	 # Replace with function body.

func write_books(code_prefix : String, code_bounds : Vector2) -> void:
	for i in range(code_bounds.x, code_bounds.y):
		var book : Book = Book.instance() as Book
		book.code = code_prefix + str(i)
		books.append(book)
