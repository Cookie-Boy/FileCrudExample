%dw 2.0

fun getExistingIds(newCars: Array<Object>, cars: Array<Object>): Array<Number> =
	do {
		var allIds = (cars map (car) -> car.id as Number)
		---
		(newCars filter (newCar) ->
			allIds contains newCar.id
		) map ((car) -> car.id)
	}