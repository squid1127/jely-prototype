extends Node2D

@onready var player:CharacterBody2D = $CharacterBody2D
@onready var camera:Camera2D = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	camera.position = player.position
	camera.position_smoothing_enabled = true
	camera.position_smoothing_speed = 2
