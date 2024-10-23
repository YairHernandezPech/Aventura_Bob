extends CanvasLayer

func _ready():
	# Actualizamos el texto con el contador inicial usando la variable global
	$CollectionCoins.text = str(Global.coins)  

	# Conectamos el evento de las monedas
	for coin in get_tree().get_nodes_in_group("coins"):
		coin.connect("coin_collected", Callable(self, "_on_coin_collected"))

func _on_coin_collected():
	print("Moneda recogida")
	# Incrementamos la cantidad de monedas en Global
	Global.coins += 1
	# Actualizamos el texto en la UI
	$CollectionCoins.text = str(Global.coins)
