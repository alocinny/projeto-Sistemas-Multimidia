extends CanvasLayer

@onready var matchStatus: TextureProgressBar = $Control/HBoxContainer/matchStatus
@onready var statusLabel: Label = $Control/HBoxContainer/NinePatchRect/statuslabel

func _ready():
	update_progressBar(60.0)

func update_progressBar(valor: float) -> void:
	valor = clamp(valor, matchStatus.min_value, matchStatus.max_value)
	
	matchStatus.value = valor
	
	var porcentagem = int((valor - matchStatus.min_value) / (matchStatus.max_value - matchStatus.min_value)*100.0)
	statusLabel.text = "%d%%" % porcentagem
	
