var Japarser = (function() {
	$.event.props.push('dataTransfer');
	
	var ret = {
		readAndUpload: function(index, file, callback) {
			var fileReader = new FileReader();
			fileReader.onload = function(e) {
		        var boundary = 'AaB03x' + parseInt(Math.random() * 9999999, 10);
	
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', '/src', true);        
		        xhr.setRequestHeader('Content-Type', 'multipart/form-data, boundary='+boundary);
		    	xhr.onreadystatechange = function() {
		    		if (xhr.readyState === 4 && xhr.status === 200) {
		    			var json = JSON.parse(xhr.responseText);
		    			callback(json);
		    		} else if (xhr.readyState === 4 && xhr.status === 0) { // for Local
		    			var json = JSON.parse(xhr.responseText);
		    			callback(json);
		    		}
		    	};
		        
		        if(typeof XMLHttpRequest.prototype.sendAsBinary !== 'function') {
		        	XMLHttpRequest.prototype.sendAsBinary = function(datastr) {
		        	    function byteValue(x) {
		        	        return x.charCodeAt(0) & 0xff;
		        	    }
		        	    var ords = Array.prototype.map.call(datastr, byteValue);
		        	    var ui8a = new Uint8Array(ords);
		        	    this.send(ui8a.buffer);
		        	}
		        }
		        
		        var data = '--' + boundary + '\r\n';
		        data += 'Content-Disposition: form-data; name="file"; filename="' + utils.toUtf8(file.name) + '"\r\n';
		        data += 'Content-Type: application/octet-stream\r\n\r\n';
		        data += fileReader.result + '\r\n';
		        data += '--' + boundary + '--';
	
		        xhr.setRequestHeader('Content-Length', data.length);
		        xhr.sendAsBinary(data);
		        
			    return true;
			};
			fileReader.readAsBinaryString(file);
		},
		
		getModifier: function(modifiersName) {
			var modifier = '';
			if(modifiersName.indexOf('public') > -1) {
				modifier = '+';
			} else if (modifiersName.indexOf('protected') > -1) {
				modifier = '#';
			} else if (modifiersName.indexOf('private') > -1) {
				modifier = '-';
			}
			return modifier;
		},
		
		buildClassDef: function(className, fields, methods) {
			var classDef = '[' + className + '|' + fields + '|' + methods + ']';
			return classDef;
		},
		
		generateImage: function(json, scruffy, direction) {
			var fields = '';
			$.each(json.fields, function() {
				fields += (Japarser.getModifier(this.modifiersName) 
							+ this.name + ';')
							.replace(/\[/g, '\uFF3B').replace(/\]/g, '\uFF3D'); //u005B, u005D is NG
			});
			
			var methods = '';
			$.each(json.methods, function() {
				methods += (Japarser.getModifier(this.modifiersName) 
							+ this.name + '(' + this.paramName + '):' 
							+ this.returnName + ';')
							.replace(/\[/g, '\uFF3B').replace(/\]/g, '\uFF3D');
			});
	
			var classDef = Japarser.buildClassDef(json.name, fields, methods);
			
			var superClassDef = (json.extendsClasses != null) ? '[' + json.extendsClasses[0].name + ']^-' : '';
			
			var diagram = '';
			var interfaceDef = '';
			if (json.implementsInterfaces != null) {
				$.each(json.implementsInterfaces, function() {
					interfaceDef += ('[' + this.name + ']^-.-' + classDef + ',');
				});
			}
			diagram += interfaceDef;
			diagram += ((superClassDef !== '') ? superClassDef + classDef : '');
			diagram = (interfaceDef === '' && superClassDef === '') ? classDef : diagram;
			diagram = diagram.replace(/</g, '\u2039')
							.replace(/>/g, '\u203A')
							.replace(/,/g, '\u201A');
			
			var requestUrl = 'http://yuml.me/diagram/' + direction;
			if (scruffy) {
				requestUrl = requestUrl + ';scruffy'
			}
			
			requestUrl = requestUrl + '/class/' + encodeURIComponent(diagram);

			var cd = $('#classDiagram');
			if (cd.length) {
				cd.attr('src', requestUrl);
				cd.attr('alt', json.name);
				cd.load(function() {
					$('#loading').hide();
					$(this).show();
				});
			} else {
				$('#yumlUsage').append('<img id="classDiagram" src="' + requestUrl + '" alt="' + json.name + '" />');
				$('#classDiagram').load(function() {
					$('#loading').hide();
					$(this).show();
				});
			}
		}
	};
	return ret;
})();