extends Control
class_name ShelfView

var books : Array = []
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerGlobals.is_active = false
	fill_shelves()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		for book in books:
			remove_child(book)
		PlayerGlobals.is_active = true
		queue_free()

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
