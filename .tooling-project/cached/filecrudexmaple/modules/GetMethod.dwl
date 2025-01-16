%dw 2.0

fun getByProperties(jsonArray: Array, params: Object) = 
	jsonArray filter ((item, index) ->
	    (
	        (params.id == null or item.id ~= params.id) and
	        (params.model == null or item.model ~= params.model) and
	        (params.mark == null or item.mark ~= params.mark) and
	        (
	            (params.yearFrom == null or item.year as Date >= params.yearFrom) and
	            (params.yearTo == null or item.year as Date <= params.yearTo)
	        ) and
	        (
	            (params.priceFrom == null or item.price as Number >= params.priceFrom) and
	            (params.priceTo == null or item.price as Number <= params.priceTo)
	        )
	    )
	)
	
fun getWrongKeys(payload: Object) = 
	keysOf(payload) -- ["id", "model", "mark", "yearFrom", "yearTo", "priceFrom", "priceTo"]