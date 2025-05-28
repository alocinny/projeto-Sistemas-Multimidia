extends CanvasLayer

@onready var matchStatus: TextureProgressBar = $Control/HBoxContainer/matchStatus
@onready var statusLabel: Label = $Control/HBoxContainer/NinePatchRect/Label

func _ready():
	# pra testar
	update_progressBar(45)

func update_progressBar(valor: float) -> void:
	valor = clamp(valor, matchStatus.min_value, matchStatus.max_value)
	
	matchStatus.value = valor
	
	var porcentagem = int((valor - matchStatus.min_value) / (matchStatus.max_value - matchStatus.min_value)*100.0)
	statusLabel.text = "%d%%" % porcentagem

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
