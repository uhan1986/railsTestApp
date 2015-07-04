$ ->
	rows = $('.clickable')
	$.each rows, ->
		$(@).on 'click', (e) ->
			id = $(@).data('event-id')
			location.href = $(@).data('href') + id
			
