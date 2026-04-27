extends Node2D

@onready var my_label = $Text/Text_to_appear/Label
@onready var tutorial = $Text/Tutorial/Text
@onready var tutorial_2 = $Text/Tutorial_2/Text

func _ready():
	my_label.hide()
	tutorial.hide()
	tutorial_2.hide()


func _on_text_to_appear_body_exited(body: CharacterBody2D) -> void:
	my_label.visible = false

func _on_text_to_appear_body_entered(body: CharacterBody2D) -> void:
	my_label.visible = true

func _on_tutorial_body_entered(body: CharacterBody2D) -> void:
	tutorial.visible = true

func _on_tutorial_body_exited(body: CharacterBody2D) -> void:
	tutorial.visible = false

func _on_tutorial_2_body_entered(body: CharacterBody2D) -> void:
	tutorial_2.visible = true

func _on_tutorial_2_body_exited(body: CharacterBody2D) -> void:
	tutorial_2.visible = false
