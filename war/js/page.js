$(function() {
	$("#tabs").tabs({fx:{opacity:'toggle', duration:'normal'}});

	$('#contactable').contactable({
		 name: 'Name',
		 email: 'Email',
		 message : 'Message',
		 subject : 'A contactable message',
		 recievedMsg : 'Thankyou for your message',
		 notRecievedMsg : 'Sorry, your message could not be sent, try again later',
		 disclaimer: 'Please feel free to get in touch, we value your feedback',
		 hideOnSubmit: true
	});
		 
    $('.facebook_like').socialbutton('facebook_like', {
    	button: 'box_count',
    });
    $('.facebook_share').socialbutton('facebook_share');
    $('.twitter').socialbutton('twitter', {
    	button: 'vertical',
    	via: 'shoito',
    	text: 'Japarser | An API for parsing Java source code.'
    });
    $('.evernote').socialbutton('evernote', {
    	button: 'site-mem-22',
    	styling: 'full'
    });
    $('.hatena').socialbutton('hatena');

	$('#parseButton').click(function() {
		$('#fileUpload').upload('/src', function(json) {
			var jsonString = JSON.stringify(json, null, $('#checkPretty').attr('checked') ? 4 : '');
			$('#output').text(jsonString);
		}, 'json');
	});
	
	$('#generateButton').click(function() {
		$('#classDiagram').hide();
		$('#loading').addClass('square').show().activity({segments: 8, width:2, space: 0, length: 3, color: '#666', speed: 1.5});
		$('#fileUploadForUml').upload('/src', function(json) {
			Japarser.generateImage(json, $('#checkScruffy').attr('checked') ? true : false,  $('input[name=direction]:checked').val());
		}, 'json');
	});
});