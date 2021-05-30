extends Control

onready var dialog = [
	"Estudantes de direito estão estudando latim em volta da fogueira!",
	"-aberratio delicti",
	"-abusus non tollit usum!",
	"-ad argumentandum tantum!",
	"-Beibe Beibe Do Beibe do Biruleibe Leibe!",
	"Oh não, os estudantes acabaram invocando algo maligno!",
	"Sou eu, bola de fogo!"
]


var dialog_index = 0
var finished = false
var counter = 0 

	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
		counter += 1 
	if counter == 6:
		$"../AnimatedSprite".show()
		
	if counter == 8:
		get_tree().change_scene("res://Maps/Map.tscn")
	
func load_dialog():
	if dialog_index < dialog.size():
		
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		$Tween.start()
		
	dialog_index += 1




func _on_Tween_tween_completed(object, key):
	finished = true
