extends Node2D

@onready var car_scene = preload("res://scenes/car.tscn")
@export var direction = "left"



func _ready():
	add_car()
	

func add_car():
	var car = car_scene.instantiate() as CharacterBody2D
	add_child(car)
	car.global_position = self.global_position
	#print(global_position)
	car.set_direction(direction)
	
