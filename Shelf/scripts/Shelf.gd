extends Node2D

const Book = preload("res://Book/scenes/Book.tscn")

export (String) var code_prefix : String
export (Vector2) var code_bounds : Vector2

var books : Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fill_shelves(books, code_prefix, code_bounds)
	 # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func fill_shelves(arr : Array, code_letter : String, code_bounds : Vector2) -> void:
	for i in range(code_bounds.x, code_bounds.y):
		var book : Book = Book.instance() as Book
		book.book_code = code_letter + str(i)
		arr.append(book)
