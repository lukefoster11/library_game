extends Node2D
class_name ShelfView

var books : Array = []
var selected_book : int = 0

onready var cursor : Node2D = $Cursor as Node2D
onready var line2D : Line2D = $Cursor/Line2D as Line2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerGlobals.camera.current = false
	PlayerGlobals.is_active = false
	fill_shelves()
	update_cursor(books.front())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		for book in books:
			remove_child(book)
		PlayerGlobals.is_active = true
		PlayerGlobals.camera.current = true
		queue_free()
	
	update_selected_book()
	
	

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

func update_selected_book() -> void:
	if Input.is_action_just_pressed("move_right"):
		if selected_book < len(books) - 1:
			selected_book += 1
			update_cursor(books[selected_book])
	
	if Input.is_action_just_pressed("move_left"):
		if selected_book > 0:
			selected_book -= 1
			update_cursor(books[selected_book])
	
	if Input.is_action_just_pressed("move_down"):
		var cur_book : Book = books[selected_book]
		var temp_select : int = selected_book
		while (temp_select + 1) < len(books) and books[temp_select + 1].position.x > books[temp_select].position.x:
			temp_select += 1
		if (temp_select + 1) < len(books):
			temp_select += 1
			while books[temp_select].position.x <= (cur_book.position.x - cur_book.dimensions.x / 2):
				temp_select += 1
			selected_book = temp_select
			update_cursor(books[selected_book])
	
	if Input.is_action_just_pressed("move_up"):
		var cur_book : Book = books[selected_book]
		var temp_select : int = selected_book
		while temp_select > 0 and books[temp_select - 1].position.x < books[temp_select].position.x:
			temp_select -= 1
		if temp_select > 0:
			temp_select -= 1
			while books[temp_select].position.x >= (cur_book.position.x + cur_book.dimensions.x / 2):
				temp_select -= 1
			selected_book = temp_select
			update_cursor(books[selected_book])


func update_cursor(book : Book) -> void:
	if book != null:
		cursor.position = book.position - Vector2(0.5, 0.5)
		line2D.points[1] = Vector2(book.dimensions.x + 1, 0)
		line2D.points[2] = Vector2(book.dimensions.x + 1, book.dimensions.y + 1)
		line2D.points[3] = Vector2(0, book.dimensions.y + 1)
		print(str(book.code_number) + " " + book.title)
