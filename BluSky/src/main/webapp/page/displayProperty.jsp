<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@taglib uri="/spring-form.tld" prefix="form" %>
<%@taglib uri="/c.tld" prefix="c" %>

<!DOCTYPE html>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="../js/jquery-1.12.2.js"></script>
</head>
<body>

<form:form action="/BluSky/property/upload" method="post" commandName="propertyForm" >
	<form:input path="propertyType"/> 
	<form:input path="type"/> 
	<form:input path="price"/> 
	<form:input path="sortBy"/> 
	<input type="submit" value="refresh" />
	<c:forEach var="properties" items="${propertyForm.propertyList }" varStatus="status">
	<div style="height:50;width:50;">
		<div>
			<img src="${properties.files[0].address}" width="50px" height="30px" />
			<div>${properties.id}</div>
		</div>
	</div>
	</c:forEach>
</form:form>

</body>
</html>