extends Level

const intro_text: Array[String] = [
	"Welcome, recruit, to the Secret Secrets Service!",
	"Here at the SSS we have one core value which we striclty adhere to:",
	"Secret Secrets are no fun...",
	"unless you tell EVERYONE!!!!",
	".............",
	"This town is full of poor souls who do not know any secrets...",
	"Your mission, should you choose to accept it, is to tell everyone a secret.",
	"Well, you're not getting paid to stand around... Get after it!"
]

func _ready():
	text = intro_text
	super()
