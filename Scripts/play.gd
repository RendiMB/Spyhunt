extends Node2D

@onready var Place_view = $Card/place
@onready var button = $Background/Button
@onready var Role_view = $Card/Role
@onready var Task_view =  $Card/Task
@onready var Player_number =$Card/Player_num
var Nom_of_pl = Count.num_players

var places = [
	"Пляж",
	"Парк",
	"Кіно",
	"Зоопарк",
	"Університет"
]

var random_index = randi() % places.size() 
var is_spy = false
var current_player = 1
var spy_index = randi() % Nom_of_pl



func _on_button_pressed() -> void:
	if current_player <= Nom_of_pl:
		Player_number.text =str(current_player)
		assign_roles(current_player)
		current_player += 1
	else:
		Place_view.text = "Гру розпочато!"
		Role_view.text = ""
		Task_view.text = ""
		Player_number.text = ""


func assign_roles(player_number: int) -> void:
	
	if player_number == spy_index +1:
		Role_view.text = "Шпигун"
		is_spy = true
		Task_view.text = "Дізнайтесь місце 
		  гри"
		Place_view.text = "Ви не знаєте локацію"
	else:
		Role_view.text = "Житель"
		Task_view.text = "Викрийте шпигуна"
		Place_view.text = places[random_index]




func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_drawing_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/paint.tscn")
