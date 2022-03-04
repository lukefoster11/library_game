extends Area2D

var interactable : bool = true

onready var Shelf : Shelf = get_parent() as Shelf

const ShelfView = preload("res://Shelf/scenes/ShelfView.tscn")



func _on_interact() -> void:
	var shelf_view : ShelfView = ShelfView.instance() as ShelfView
	shelf_view.books = Shelf.books
	get_tree().current_scene.add_child(shelf_view)
	print("Interacted")

func _on_interactable_enter() -> void:
	print("Hello")

func _on_interactable_exit() -> void:
	print("Goodbye")
