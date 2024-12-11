extends Node2D


func _ready() -> void:
	$LineEdit.text = str(Count.num_players)

func _on_button_pressed() -> void:
	Count.num_players = $LineEdit.text.to_int()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
