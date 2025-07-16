class_name State extends Node

static var player : Player

func _ready():
	pass

# What happens when the player enters this state?
func Enter() -> void:
	pass

# What happens when the player exits this state
func Exit() -> void:
	pass

# What happens during the process update in this state
func Process(_delta : float) -> State:
	return null

# What happens during the physics update in this state
func Physics(_delta: float) -> State:
	return null

# What happens during the handleInput update in this state
func HandleInput(_event: InputEvent) -> State:
	return null
