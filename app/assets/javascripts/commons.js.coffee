$ ->
	rows = $('.clickable')
	$.each rows, -> 
		$(@).on 'click', (e) ->
			id = $(@).data('event-id')
			location.href = '.' + location.pathname.split('/')[0] + '/event/' + id
			
