extends Node2D
class_name Shelf

const Book = preload("res://Book/scenes/Book.tscn")

export (String) var code_prefix : String = ""
export (Vector2) var code_bounds : Vector2

var books : Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var code_nums : Array = write_books(code_bounds)
	for i in len(books):
		books[i].code_number = code_nums[i]
		books[i].code_prefix = code_prefix
		BookGlobals.all_books.append(books[i])

func write_books(code_bounds : Vector2) -> Array:
	var row : int = 1
	var xpos : int = 6
	var code_nums : Array = []
	while row < 7:
		var book : Book = Book.instance() as Book
		if xpos + book.dimensions.x >= 474:
			if row > 5:
				break
			else:
				xpos = 6
				row += 1
		books.append(book)
		code_nums.append(stepify(rand_range(code_bounds.x, code_bounds.y), 0.1))
		xpos += book.dimensions.x
	code_nums.sort()
	for i in range(1, len(code_nums)):
		if code_nums[i] == code_nums[i-1]:
			code_nums[i] += 0.01
	return code_nums

func write_sequel(prev_book : Book, book : Book) -> Book:
	book.dimensions = prev_book.dimensions
	book.Spine = prev_book.Spine
	book.base_color = prev_book.base_color
	book.design_color = prev_book.design_color
	book.code = prev_book.code
	return book

class SortByCode:
	static func sort_by_code(a : Book, b : Book) -> bool:
		if a.code_number < b.code_number:
			return true
		else:
			return false
