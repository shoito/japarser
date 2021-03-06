<%@page pageEncoding="UTF-8" isELIgnored="false" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="f" uri="http://www.slim3.org/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Japarser | Web API for parsing Java source code.</title>
<link rel="shortcut icon" href="favicon.ico">
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/JavaScript" />
<meta name="keywords" content="Web,API,Java,GAE,source code">
<meta name="description" content="An API for parsing Java source code.">
<link type="text/css" href="css/style.css?v1" rel="stylesheet" />
<link type="text/css" href="css/faary.css?v1" rel="stylesheet" />
<link type="text/css" href="css/jquery-ui-1.8.10.custom.css?v1" rel="stylesheet" />
<link type="text/css" href="css/contactable.css?v1" rel="stylesheet" />
<script	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.js"></script>
<script	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>
<script src="js/jquery.validate.pack.js?v1"></script>
<script src="js/jquery.contactable.min.js?v1"></script>
<script src="js/jquery.upload-1.0.2.min.js?v1"></script>
<script src="js/jquery.socialbutton-1.7.1.js?v1"></script>
<script src="js/jquery.activity-indicator-1.0.0.min.js?v1"></script>
<script src="js/utils.js?v1"></script>
<script src="js/japarser.js?v1"></script>
<script src="js/page.js?v1"></script>
<script src="js/dropzone.js?v1"></script>
</head>
<body>
	<div class="container clearfix">
		<div id="header">
			<h1><span class="titlewrapper">{</span><span class="title">japarser</span><span class="titlewrapper">}</span></h1>
		</div>
		<div id="tabs" class="grid11 first">
			<ul>
				<li><a href="#intro"><fmt:message key="intro.tab" /></a>
				</li>
				<li><a href="#demo"><fmt:message key="demo.tab" /></a>
				</li>
				<li><a href="#usage"><fmt:message key="usage.tab" /></a>
				</li>
				<!-- 
				<li><a href="#about">About</a>
				</li>
				-->
			</ul>
			<div id="intro">
				<h2><fmt:message key="intro.abs" /></h2>
				<p><fmt:message key="intro.detail" /></p>
				<h3><fmt:message key="intro.repository" /></h3>
				<p><a href="https://github.com/shoito/japarser">https://github.com/shoito/japarser</a></p>
				<h3><fmt:message key="intro.requestUrl" /></h3>
				<p><a href="http://japarser.appspot.com/src">http://japarser.appspot.com/src</a></p>
				<hr>
				<h4>Method: GET</h4>
				<table>
				    <tbody>
				        <tr>
				            <th><fmt:message key="intro.parameter" /></th>
				            <th><fmt:message key="intro.type" /></th>
				            <th><fmt:message key="intro.description" /></th>
				        </tr>
				        <tr>
				            <td><fmt:message key="intro.url" /></td>
				            <td><fmt:message key="intro.url.type" /></td>
				            <td><fmt:message key="intro.url.description" /></td>
				        </tr>
				        <tr>
				            <td><fmt:message key="intro.pretty" /></td>
				            <td><fmt:message key="intro.pretty.type" /></td>
				            <td><fmt:message key="intro.pretty.description" /></td>
				        </tr>
				    </tbody>
				</table>
				<h5><fmt:message key="intro.examples" /></h5>
				<div>
					<small>
						<ul>
							<li><a href="http://japarser.appspot.com/src?url=http://google-guice.googlecode.com/svn/trunk/core/src/com/google/inject/Key.java" target="_blank">http://japarser.appspot.com/src?url=http://google-guice.googlecode.com/svn/trunk/core/src/com/google/inject/Key.java</a></li>
							<li><a href="http://japarser.appspot.com/src?url=https://github.com/jenkinsci/jenkins/raw/master/core/src/main/java/hudson/ExtensionFinder.java&pretty=false" target="_blank">http://japarser.appspot.com/src?url=https://github.com/jenkinsci/jenkins/raw/master/core/src/main/java/hudson/ExtensionFinder.java&pretty=false</a></li>
							<li><a href="http://japarser.appspot.com/src?url=https://bitbucket.org/jmurty/jets3t/raw/da5139dc1f23/src/org/jets3t/service/model/StorageObject.java&pretty=true" target="_blank">http://japarser.appspot.com/src/?url=https://bitbucket.org/jmurty/jets3t/raw/da5139dc1f23/src/org/jets3t/service/model/StorageObject.java&pretty=true</a></li>
						</ul>
					</small>
				</div>
				<hr>
				<h4>Method: POST</h4>
				<table>
				    <tbody>
				        <tr>
				            <th><fmt:message key="intro.parameter" /></th>
				            <th><fmt:message key="intro.type" /></th>
				            <th><fmt:message key="intro.description" /></th>
				        </tr>
				        <tr>
				            <td><fmt:message key="intro.file" /></td>
				            <td><fmt:message key="intro.file.type" /></td>
				            <td><fmt:message key="intro.file.description" /></td>
				        </tr>
				        <tr>
				            <td><fmt:message key="intro.pretty" /></td>
				            <td><fmt:message key="intro.pretty.type" /></td>
				            <td><fmt:message key="intro.pretty.description" /></td>
				        </tr>
				    </tbody>
				</table>
				<h5><fmt:message key="intro.examples" /></h5>
				<div>
					<small>
						<p><fmt:message key="intro.refer.demo" /></p>
					</small>
				</div>
				<h4><fmt:message key="intro.json" /></h4>
				<pre>
{
    "fields": [
        {
            "line": 90,
            "modifiersName": "private static final",
            "name": "DEFAULT_SEARCH_URL",
            "qualifiedTypeName": "String",
            "simpleTypeName": "String"
        },
        {
            "line": 96,
            "modifiersName": "private static final",
            "name": "SEARCH_BUTTON_DEFAULT_TEXT",
            "qualifiedTypeName": "String",
            "simpleTypeName": "String"
        },
        {
            "line": 101,
            "modifiersName": "private static final",
            "name": "SEARCH_BUTTON_WAITING_TEXT",
            "qualifiedTypeName": "String",
            "simpleTypeName": "String"
        },
        {
            "line": 103,
            "modifiersName": "private",
            "name": "jsonTree",
            "qualifiedTypeName": "Tree",
            "simpleTypeName": "Tree"
        },
        {
            "line": 108,
            "modifiersName": "private final",
            "name": "requestBuilder",
            "qualifiedTypeName": "RequestBuilder",
            "simpleTypeName": "RequestBuilder"
        },
        {
            "line": 111,
            "modifiersName": "private",
            "name": "searchButton",
            "qualifiedTypeName": "Button",
            "simpleTypeName": "Button"
        }
    ],
    "interface": false,
    "line": 50,
    "methods": [
        {
            "constructor": false,
            "line": 117,
            "modifiersName": "public",
            "name": "onModuleLoad",
            "paramName": "",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 125,
            "modifiersName": "private",
            "name": "addChildren",
            "paramName": "TreeItem treeItem, JSONValue jsonValue",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 151,
            "modifiersName": "private",
            "name": "displayError",
            "paramName": "String errorType, String errorMessage",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 163,
            "modifiersName": "private",
            "name": "displayJSONObject",
            "paramName": "JSONValue jsonValue",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 172,
            "modifiersName": "private",
            "name": "displayParseError",
            "paramName": "String responseText",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 176,
            "modifiersName": "private",
            "name": "displayRequestError",
            "paramName": "String message",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 180,
            "modifiersName": "private",
            "name": "displaySendError",
            "paramName": "String message",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 187,
            "modifiersName": "private",
            "name": "doFetchURL",
            "paramName": "",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 200,
            "modifiersName": "private",
            "name": "getChildText",
            "paramName": "String text",
            "returnName": "String"
        },
        {
            "constructor": false,
            "line": 207,
            "modifiersName": "private",
            "name": "initializeMainForm",
            "paramName": "",
            "returnName": "void"
        },
        {
            "constructor": false,
            "line": 237,
            "modifiersName": "private",
            "name": "resetSearchButtonCaption",
            "paramName": "",
            "returnName": "void"
        }
    ],
    "name": "JSON",
    "qualifiedTypeName": "com.google.gwt.sample.json.client.JSON"
}
				</pre>
			</div>
			<div id="demo" class="iform">
				<ul>
					<li class="iheader"><fmt:message key="demo.select.file" /></li>
					<li><label>.java</label><input type="file" name="file" id="fileUpload" class="itext" /></li>
					<li><label for="CheckOption"><fmt:message key="demo.json.format" /></label>
					<ul>
						<li><input class="icheckbox" type="checkbox" name="CheckOption"
							id="checkPretty" value="pretty"><label for="checkPretty"
							class="ilabel">pretty</label></li>
					</ul>
					</li>
					<li><label>&nbsp;</label><input type="button" class="ibutton" id="parseButton" value="Parsing" /></li>
					<li class="iheader"><fmt:message key="demo.result" /></li>
					<li><textarea id="output" class="itextarea"></textarea></li>
				</ul>
			</div>
			<div id="usage" class="iform">
				<h2><fmt:message key="usage.ex1.abs" /></h2>
				<div id="yumlUsage">
					<ul>
						<li class="iheader"><fmt:message key="demo.select.file" /></li>
						<li><label>.java</label><input type="file" name="file" id="fileUploadForUml" class="itext" /></li>
						<li><input class="iradio" type="radio" name="direction"
							id="checkDirectionLeftRight" value="dir:lr" checked><label for="checkDirectionLeftRight"
							class="ilabel">Direction:Left-Right</label>
							<input class="iradio" type="radio" name="direction"
							id="checkDirectionTopDown" value="dir:td"><label for="checkDirectionTopDown"
							class="ilabel">Direction:Top-Down</label>
						</li>
						<li><input class="icheckbox" type="checkbox" name="CheckOption"
							id="checkScruffy" value="scruffy"><label for="checkScruffy"
							class="ilabel">Scruffy Mode</label></li>
						<li><label>&nbsp;</label><input type="button" class="ibutton" id="generateButton" value="Generate UML" /></li>
					</ul>
					<div id="loading"></div>
				</div>
				<h2><fmt:message key="usage.ex2.abs" /></h2>
				<a href="https://chrome.google.com/webstore/detail/pjkknfedjcaagjfalcfnfoebghfgjnbd"><img src="img/javadoc2class_thumb.jpg" class="thumbnail" /></a>
				<h2><fmt:message key="usage.ex3.abs" /></h2>
				<a href="https://chrome.google.com/webstore/detail/pjkknfedjcaagjfalcfnfoebghfgjnbd"><img src="img/java2class_thumb.jpg" class="thumbnail" /></a>
			</div>
			<!-- 
			<div id="about">
				<iframe src="http://about.me/shoito" width="100%" height="100%" seamless scrolling="no"></iframe>
			</div>
			-->
		</div>
		<div id="share" class="grid1">
			<div class="facebook_like"></div>
			<div class="twitter"></div>
			<div class="hatena"></div>
			<div class="facebook_share"></div>
			<div class="evernote"></div>
		</div>
		<div id="footer" class="grid12">
			<p id="copyright"><small> </small></p>
		</div>
	</div>
	<div id="contactable">
	</div>
	<script type="text/javascript">
	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-677679-8']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();
	</script>
</body>
</html>
