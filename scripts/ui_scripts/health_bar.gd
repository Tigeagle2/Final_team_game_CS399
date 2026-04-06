extends Control
@export  var linked_node: Node = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if "health" in linked_node:
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
