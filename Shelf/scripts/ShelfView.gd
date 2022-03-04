extends Control
class_name ShelfView

var books : Array = []
var selected_book : int = 0

onready var cursor : Node2D = $Cursor as Node2D
onready var line2D : Line2D = $Cursor/Line2D as Line2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerGlobals.is_active = false
	fill_shelves()
	update_cursor(books.front())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		for book in books:
			remove_child(book)
		PlayerGlobals.is_active = true
		queue_free()
	
	if Input.is_action_just_pressed("move_right"):
		if selected_book < len(books) - 1:
			selected_book += 1
			var book : Book = books[selected_book]
			update_cursor(book)
	
	if Input.is_action_just_pressed("move_left"):
		if selected_book > 0:
			selected_book -= 1
			var book : Book = books[selected_book]
			update_cursor(book)

func fill_shelves() -> void:
	var rem : Array = fill_shelf(books, 1)
	rem = fill_shelf(rem, 2)
	rem = fill_shelf(rem, 3)
	rem = fill_shelf(rem, 4)
	rem = fill_shelf(rem, 5)
	rem = fill_shelf(rem, 6)

func fill_shelf(rem_books, row) -> Array:
	var i : int = 0
	var x : int = 6
	for book in rem_books:
		if x + book.dimensions.x < 474:
			add_child(book)
			book.position = Vector2(x, row*44-book.dimensions.y)
			x += book.dimensions.x
			i += 1
		else:
			break
	return rem_books.slice(i, -1)

func update_cursor(book : Book) -> void:
	if book != null:
		cursor.position = book.position - Vector2(0.5, 0.5)
		line2D.points[1] = Vector2(book.dimensions.x + 1, 0)
		line2D.points[2] = Vector2(book.dimensions.x + 1, book.dimensions.y + 1)
		line2D.points[3] = Vector2(0, book.dimensions.y + 1)
