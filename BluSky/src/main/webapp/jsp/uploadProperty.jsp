<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@taglib uri="/spring-form.tld" prefix="form" %>

<!DOCTYPE html>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
okay! you are here!
<form:form action="/BluSky/property/upload" method="post" commandName="testBean">
	<form:input path="request"/> 
	<form:input path="response"/> 
	<input type="submit" value="submit" />
</form:form>

</body>
</html>