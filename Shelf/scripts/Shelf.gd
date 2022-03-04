class_name Shelf
extends Node2D

const Book = preload("res://Book/scenes/Book.tscn")

export (String) var code_prefix : String = ""
export (Vector2) var code_bounds : Vector2

var books : Array = []


func _ready() -> void:
	var code_nums : Array = write_books(code_bounds)
	for i in len(books):
		books[i].code_number = code_nums[i]
		books[i].code_prefix = code_prefix
		BookGlobals.all_books.append(books[i])

# Fill `books` array with `Book` instances
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
	code_nums = rid_dups(code_nums)
	return code_nums

# Get rid of all duplicate elements in `list`
#   add 0.001 to each subsequent repeat of element
func rid_dups(list : Array) -> Array:
	for i in range(len(list)):
		var count = list.count(list[i])
		if count > 1:
			for j in range(1, count):
				list[i+j] = list[i+j-1] + 0.001
	return list
