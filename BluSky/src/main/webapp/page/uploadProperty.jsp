<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@taglib uri="/spring-form.tld" prefix="form" %>

<!DOCTYPE html>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="../js/jquery-1.12.2.js"></script>
</head>
<body>
okay! you are here!
<form:form action="/BluSky/property/upload" method="post" commandName="propertyBean" enctype="multipart/form-data">
	<form:input path="address"/> 
	<form:input path="city"/> 
	<form:input path="zipCode"/> 
	<form:input path="Country"/> 
	<form:input path="propertyType"/> 
	<form:input path="type"/> 
	<div id="files">
	<input type="file" name="btnFile"/> 
	</div>
	<button onclick="return addMore();">ADD MORE</button>
	<input type="submit" value="submit" />
</form:form>

</body>
<script>
	function addMore(){
		$("#files").append('<input type="file" name="btnFile"/> ');
		return false;
	}


</script>
</html>