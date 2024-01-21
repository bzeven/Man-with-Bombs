extends CharacterBody2D

@export var speed : int  = 40
@export var value : int
@export var left : bool
@export var up : bool
@export var idle : bool = false

var dir : String




func _ready():
	choose_direction()

func _physics_process(delta):
	move()
#	print(value,Xaxis,Yaxis)

func choose_direction():
	velocity.x = 0
	velocity.y = 0
	$Direction_Timer.start(2.0)
	var d4 = randi_range(0,5)
	if d4 == 1:
		dir = "up"
		print("Walking up.")
	elif d4 == 2:
		dir = "down"
		print("Walking down.")
	elif d4 == 3:
		dir = "left"
		print("Walking left.")
	elif d4 == 4:
		dir = "right"
		print("Walking right.")
	else:
		dir = "idle"
		print("Idling.")
	return dir
	
	
func _idle():
	$AnimatedSprite.play("idle")
		
		
func move():
	if dir == "right":
		var direction_x = 1
		velocity.x = direction_x * speed
		$AnimatedSprite.play("walk_left")
		$AnimatedSprite.flip_h = true
	elif dir == "left":
		var direction_x = -1
		velocity.x = direction_x * speed
		$AnimatedSprite.play("walk_left")
		$AnimatedSprite.flip_h = false
	elif dir == "up":
		var direction_y = -1
		velocity.y = direction_y * speed
		$AnimatedSprite.play("walk_up")
		$AnimatedSprite.flip_h = false
	elif dir == "down":
		var direction_y = 1
		velocity.y = direction_y * speed
		$AnimatedSprite.play("walk_down")
		$AnimatedSprite.flip_h = false
	else:
		_idle()

	move_and_slide()


func _on_direction_timer_timeout():
	choose_direction()
