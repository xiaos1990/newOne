<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href=" /bitbug_favicon.ico" /> 
<title>Cat & Dog</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link href='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css' rel='stylesheet' type='text/css'>
<%-- <link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/homepage.css" />
<link rel="stylesheet" href="${path}/css/animate.css" /> --%>
</head>




<body>
	<p>
  <label for="amount">Price range:</label>
  <input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
</p>
 
<div id="slider-range"></div>
	<script src="${path}/js/jquery-1.12.2.js"></script>
	<%-- <script src="${path}/js/bootstrap.min.js"></script>
	<script src="${path}/js/jquery.singlePageNav.min.js"></script>
	<script src="${path}/js/wow.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
	<script src="${path}/js/blusky.js"></script> --%>
	<script src="${path}/js/jquery-ui.min.js"></script>
	
	<script>
		$(function(){
			
    $( "#slider-range" ).slider({
      range: true,
      min: 0,
      max: 500,
      values: [ 75, 300 ],
      slide: function( event, ui ) {
        $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
      " - $" + $( "#slider-range" ).slider( "values", 1 ) );
  });
		
	</script>
</body>