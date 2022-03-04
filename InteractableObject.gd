class_name InteractableObject
extends Area2D

var interactable : bool

func _init() -> void:
	set_collision_layer_bit(1, true)

func _on_interact():
	print("Interacted with " + self.name)

func _on_interactable_enter():
	pass

func _on_interactable_exit():
	pass
