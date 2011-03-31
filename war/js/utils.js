var utils = (function() {
	var ret = {
		toUtf8: function (string) {
			string = string.replace(/\r\n/g,"\n");
			var ret = "";
	 
			for (var n = 0; n < string.length; n++) {
				var c = string.charCodeAt(n);
				if (c < 128) {
					ret += String.fromCharCode(c);
				}
				else if((c > 127) && (c < 2048)) {
					ret += String.fromCharCode((c >> 6) | 192);
					ret += String.fromCharCode((c & 63) | 128);
				}
				else {
					ret += String.fromCharCode((c >> 12) | 224);
					ret += String.fromCharCode(((c >> 6) & 63) | 128);
					ret += String.fromCharCode((c & 63) | 128);
				}
			}
			return ret;
		}
	};
	return ret;
})();