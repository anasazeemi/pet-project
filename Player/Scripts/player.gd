class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine


func _ready():
	state_machine.Initialize(self)
	pass


func _process(delta):
#	The .normalized() prevents the total magnitude of the vector being greater than one
#	This fixes the issue of the character walking twice as fast while walking diagonally
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()
	pass


func _physics_process(delta):
	move_and_slide()


func SetDirection() -> bool:
	var new_Dir :Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	
	if direction.y == 0:
		new_Dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_Dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_Dir == cardinal_direction:
		return false
	
	cardinal_direction = new_Dir
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true


func UpdateAnimation(state) -> void:
	animation_player.play(state + "_" + AnimDirection())
	pass


func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
