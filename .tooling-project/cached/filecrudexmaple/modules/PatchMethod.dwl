%dw 2.0

fun getUpdatedCars(cars: Array<Object>, id: Number, newItem: Object): Array<Object> = 
	cars map (item) -> (
	if (item.id == id)
		item mapObject (value, key) -> (
		if (newItem[key] != null) { (key): newItem[key] }
		else { (key): value }
		)
	else
		item
)

fun getInvalidKeys(car: Object): Array<String> =
	keysOf(car) -- ["id", "model", "mark", "year", "price"]