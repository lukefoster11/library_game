extends Area2D

var interactable_object : InteractableObject = null
var prev_objects : Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PlayerGlobals.is_active and Input.is_action_just_pressed("interact"):
		if interactable_object != null:
			if interactable_object.interactable:
				interactable_object._on_interact()


func _on_InteractionDetector_area_entered(area: Area2D) -> void:
	if interactable_object != null:
		prev_objects.append(interactable_object)
		if interactable_object.has_method("_on_interactable_exit"):
			interactable_object._on_interactable_exit()
	interactable_object = area as InteractableObject
	if interactable_object.has_method("_on_interactable_enter"):
		interactable_object._on_interactable_enter()

func _on_InteractionDetector_area_exited(area: Area2D) -> void:
	if interactable_object == area:
		if interactable_object.has_method("_on_interactable_exit"):
			interactable_object._on_interactable_exit()
		interactable_object = prev_objects.pop_back()
	else:
		prev_objects.erase(area)
