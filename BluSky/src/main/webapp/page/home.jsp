<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>

<title>home</title>
<style type="text/css">
#header {
	top: 0;
	left: 0;
	right:0;
	/* border: none; */
	position: fixed;
	z-index: 100;
}

#body {
	margin-left: 10%;
	margin-right: 10%;
	border: none;
	margin-top:200px;
}

#foot {
	margin-left: 10%;
	margin-right: 10%;
	border: none;
}
</style>

<script type="text/javascript" >   
var browserVersion = window.navigator.userAgent.toUpperCase();
var isOpera = false, isFireFox = false, isChrome = false, isSafari = false, isIE = false;
function reinitIframe(iframeId, minHeight) {
    try {
        var iframe = document.getElementById(iframeId);
        var bHeight = 0;
        if (isChrome == false && isSafari == false)
            bHeight = iframe.contentWindow.document.body.scrollHeight;

        var dHeight = 0;
        if (isFireFox == true)
            dHeight = iframe.contentWindow.document.documentElement.offsetHeight + 2;
        else if (isIE == false && isOpera == false)
            dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
        else if (isIE == true && ! -[1, ] == false) { } //ie9+
        else
            bHeight += 3;

        var height = Math.max(bHeight, dHeight);
        if (height < minHeight) height = minHeight;
        iframe.style.height = height + "px";
    } catch (ex) { }
}
function startInit(iframeId, minHeight) {
    isOpera = browserVersion.indexOf("OPERA") > -1 ? true : false;
    isFireFox = browserVersion.indexOf("FIREFOX") > -1 ? true : false;
    isChrome = browserVersion.indexOf("CHROME") > -1 ? true : false;
    isSafari = browserVersion.indexOf("SAFARI") > -1 ? true : false;
    if (!!window.ActiveXObject || "ActiveXObject" in window)
        isIE = true;
    window.setInterval("reinitIframe('" + iframeId + "'," + minHeight + ")", 100);
} 

  startInit('body', 800); 
</script>
</head>
<body>
	<div class="page">
		
			<iframe name="head" id="header" src="head.jsp" width="100%"
				height="200px"></iframe>
		
		
			<iframe name="body" id="body" src="/BluSky/property/display" width="80%" height="1000px"></iframe>
	
			<iframe name="foot" id="foot" src="foot.jsp" width="80%"
				height="50px"></iframe>
	
	</div>



</body>


</html>
