$(function() {
	$.event.props.push('dataTransfer');
	
	registerDropZone('#demo', function(json) {
		var jsonString = JSON.stringify(json, null, $('#checkPretty').attr('checked') ? 4 : '');
		$('#output').text(jsonString);
	});
	
	registerDropZone('#yumlUsage', function(json) {
		Japarser.generateImage(json);
	});

	function registerDropZone(id, callback) {
		$(id).mouseover(function(e) {
			return false;
		}).mouseout(function(e) {
			$(this).removeClass('drag');
			return false;
		}).bind('dragover', function(e) {
			e.preventDefault();
			return false;
		}).bind('dragenter', function(e) {
			e.preventDefault();
			$(this).addClass('drag');
			return false;
		}).bind('dragleave', function(e) {
			e.preventDefault();
			$(this).removeClass('drag');
			return false;
		}).bind('drop', function(e) {
			e.preventDefault();
			
			$(this).removeClass('drag');
			
			$.each(e.dataTransfer.files, function(index, file) {
				Japarser.readAndUpload(index, file, function(json) {
					callback(json);
				});
			});
		
			return false;
		});	
	}
});