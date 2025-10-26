extends CharacterBody2D

var direction:Vector2 = Vector2(0,0)
var speed:=500
var directionend:Vector2 = Vector2(0,0)

func get_input():
	direction= Input.get_vector("left","right","up","down")

	
func _physics_process(_delta: float) -> void:
	get_input()
	if direction.x:
		directionend = direction
	animation()
	velocity = direction*speed
	move_and_slide()
	
func animation():
	$Sprite2D.flip_h = direction.x >0 or(directionend.x>0 and direction.x==0)
	$AnimationPlayer.current_animation="run"	if direction else"idle"
	if $AnimationPlayer.current_animation=="idle" and directionend.x>0:
		$Sprite2D.flip_h = true
		
			
		
		
