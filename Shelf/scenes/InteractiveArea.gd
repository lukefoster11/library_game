extends Area2D

var interactable : bool = true

const ShelfView = preload("res://Shelf/scenes/ShelfView.tscn")

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _on_interact() -> void:
	var shelf_view = ShelfView.instance()
	get_tree().current_scene.add_child(shelf_view)
	print("Interacted")

func _on_interactable_enter() -> void:
	print("Hello")

func _on_interactable_exit() -> void:
	print("Goodbye")
