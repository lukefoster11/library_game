extends InteractableObject

onready var Shelf : Shelf = get_parent() as Shelf

const ShelfView = preload("res://Shelf/scenes/ShelfView.tscn")

func _ready() -> void:
	interactable = true

func _on_interact() -> void:
	var shelf_view : ShelfView = ShelfView.instance() as ShelfView
	shelf_view.books = Shelf.books
	get_tree().current_scene.add_child(shelf_view)

func _on_interactable_enter() -> void:
	print("Hello")

func _on_interactable_exit() -> void:
	print("Goodbye")
