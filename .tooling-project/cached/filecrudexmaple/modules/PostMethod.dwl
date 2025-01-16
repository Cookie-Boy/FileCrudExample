%dw 2.0

fun getExistingIds(newCars: Array<Object>, cars: Array<Object>): Array<Number> =
	do {
		var allIds = (cars map (car) -> car.id as Number)
		---
		(newCars filter (newCar) ->
			allIds contains newCar.id
		) map ((car) -> car.id)
	}
	
fun getInvalidCars(cars: Array<Object>): Array<Object> =
	do {
		var validKeys = ["id", "model", "mark", "year", "price"]
		---
        cars filter ((car) -> 
            !(car is Object) or
            (keysOf(car) -- validKeys) != [] or
            !(car.id is Number and car.model is String and car.mark is String and car.year is Number and car.price is Number)
        )
	}