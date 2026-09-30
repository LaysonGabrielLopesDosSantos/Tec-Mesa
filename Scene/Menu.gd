extends Control

var D20 = 0
var D20Bonus = 0
var D202 = 0
var D20Bonus2 = 0
var LevelText = "0"
var Value1 = 0
var Value2 = 0

func _ready():
	randomize()

# warning-ignore:unused_argument
func _process(delta):
	_value()
	_value2()
	_damage()
	_comparator()
	_comparator2()

func _comparator():
	var Attribute1 = int($Functions/Comparator/Layout4/Attribute1.text)
	var Attribute2 = int($Functions/Comparator/Layout4/Attribute2.text)
	var Result = $Functions/Comparator/Layout4/Result
	var ComparatorOthers = $"Functions/Comparator/Layout4/Comparator others"
	var Why = Attribute1 - Attribute2
	
	if Why >= -5 and Why <= 5:
		Result.text = "[EMPATE!]"
	elif Why < -5:
		Result.text = "[ATRIBUTO 2 GANHOU!]"
	else:
		Result.text = "[ATRIBUTO 1 GANHOU!]"

func _comparator2():
	var ComparatorOthers = $"Functions/Comparator/Layout4/Comparator others"
	var Result = $Functions/Comparator/Layout4/Result2
	
	$Functions/Comparator/Layout4/Value1.text = str(Value1)
	$Functions/Comparator/Layout4/Value2.text = str(Value2)
	
	if Main._kjp("MouseLeft"):
		if ComparatorOthers.pressed == true:
			var Why = Value1 - Value2
			if Why >= -5 and Why <= 5:
				Result.text = "[EMPATE!]"
			elif Why < -5:
				Result.text = "[ATRIBUTO 2 GANHOU!]"
			else:
				Result.text = "[ATRIBUTO 1 GANHOU!]"

func _damage():
	var Damage = int($Functions/Comparator/Layout2/Damage.text)
	var Resistance = int($Functions/Comparator/Layout2/Resistance.text)
	var PhysicLosted = $"Functions/Comparator/Layout2/Physic losted"
	var Damaged = max(0, Damage - Resistance)
	
	if Damaged < 5:
		PhysicLosted.text = "[BLOQUEADO!]"
	else:
		PhysicLosted.text = str(floor(Damaged / 5))

func _value():
	var AttributeBase = int($"Functions/Value2/Layout2/Attribute base".text)
	var Percent = int($Functions/Value2/Layout2/Percent.text) / 100.0
	var TypeOfAction = $"Functions/Value2/Layout2/Type of action"
	var ActionValue = $"Functions/Value2/Layout2/Action value"
	var D20Roll = $Functions/Value2/Layout4/Roll
	var Roll = $"Functions/Value2/Layout4/D20 value"
	var Actionwithd20 = $"Functions/Value2/Layout4/Action with d20 value"
	var Bonus = $"Functions/Value2/Layout4/Bonus critico"
	
	Actionwithd20.text = str(int(ActionValue.text) + D202 + D20Bonus2)
	Value2 = int(Actionwithd20.text)
	
	if TypeOfAction.pressed == false:
		TypeOfAction.text = "Ataque"
		ActionValue.text = str(floor(AttributeBase * Percent))
	else:
		TypeOfAction.text = "Outros"
		ActionValue.text = str(AttributeBase + floor(AttributeBase * Percent))
	
	if Main._kjp("MouseLeft"):
		if D20Roll.pressed == true:
			D202 = randi() % 20 + 1
	
	if D202 < 20:
		Roll.text = str(D202)
		D20Bonus2 = 0
		Bonus.text = "0"
	else:
		Roll.text = str(D202) + " [CRÍTICO!]"
		D20Bonus2 = floor(AttributeBase * 0.5)
		Bonus.text = str(floor(AttributeBase * 0.5))

func _value2():
	var AttributeBase = int($"Functions/Value/Layout2/Attribute base".text)
	var Percent = int($Functions/Value/Layout2/Percent.text) / 100.0
	var TypeOfAction = $"Functions/Value/Layout2/Type of action"
	var ActionValue = $"Functions/Value/Layout2/Action value"
	var D20Roll = $Functions/Value/Layout4/Roll
	var Roll = $"Functions/Value/Layout4/D20 value"
	var Actionwithd20 = $"Functions/Value/Layout4/Action with d20 value"
	var Bonus = $"Functions/Value/Layout4/Bonus critico"
	
	Actionwithd20.text = str(int(ActionValue.text) + D20 + D20Bonus)
	Value1 = int(Actionwithd20.text)
	
	if TypeOfAction.pressed == false:
		TypeOfAction.text = "Ataque"
		ActionValue.text = str(floor(AttributeBase * Percent))
	else:
		TypeOfAction.text = "Outros"
		ActionValue.text = str(AttributeBase + floor(AttributeBase * Percent))
	
	if Main._kjp("MouseLeft"):
		if D20Roll.pressed == true:
			D20 = randi() % 20 + 1
	
	if D20 < 20:
		Roll.text = str(D20)
		D20Bonus = 0
		Bonus.text = "0"
	else:
		Roll.text = str(D20) + " [CRÍTICO!]"
		D20Bonus = floor(AttributeBase * 0.5)
		Bonus.text = str(floor(AttributeBase * 0.5))
