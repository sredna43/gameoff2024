extends Level

const intro_text = [
	"Welcome, recruit, to the Secret Secrets Service!",
	"Here at the SSS we have one core value which we striclty adhere to:",
	"Secret Secrets are no fun...",
	"unless you tell EVERYONE!!!!",
	".............",
	"This town is full of poor souls who do not know any secrets...",
	"Your mission, should you choose to accept it, is to tell everyone a secret.",
	"Well, you're not getting paid to stand around... Get after it!"
]

@onready var player: Player = $Player

var on_dialogue_line = 0
var in_dialogue = true

func exit_cutscene():
	player.exit_cutscene()
	in_dialogue = false

func next_dialogue():
	if !in_dialogue:
		return
	on_dialogue_line = min(on_dialogue_line + 1, intro_text.size() - 1)
	print(intro_text[on_dialogue_line])
	if on_dialogue_line == intro_text.size() - 1:
		exit_cutscene()

func skip_dialogue():
	on_dialogue_line = intro_text.size() - 1
	print(intro_text[on_dialogue_line])
	exit_cutscene()


func _ready():
	player.enter_cutscene()
	print(intro_text[on_dialogue_line])
	super()


func _process(_delta):
	if (Input.is_action_just_pressed("select") or Input.is_action_just_pressed("ui_select")):
		next_dialogue()
	if (Input.is_action_just_pressed("back") or Input.is_action_just_pressed("ui_cancel")):
		skip_dialogue()
