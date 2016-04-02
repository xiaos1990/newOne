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
<style>
.main {
width:45%;
float:left;
border:solid;
}
.formDiv {
width:100%;
height:50px;

}

</style>
</head>
<body>

<form:form action="/BluSky/property/upload" method="post" commandName="propertyForm" >
<div class="formDiv">
	<form:input path="propertyType"/> 
	<form:input path="type"/> 
	<form:input path="price"/> 
	<form:input path="sortBy"/> 
	<input type="submit" value="refresh" />
	</div>
	<c:forEach var="properties" items="${propertyForm.propertyList }" varStatus="status">
	<div class="main">
		<div>
		<a href="#"><img src="${properties.files[0].address}" /></a>
			<div style="width:20%;float:right">
			<div style="float:left">Address:${properties.id}</div>
			<br/>
			<div style="float:left">Address:${properties.id}</div>
			<br/>
			<div style="float:left">Address:${properties.id}</div>
			<br/>
			<div style="float:left">Address:${properties.id}</div>
			</div>
		</div>
	</div>
	</c:forEach>
</form:form>

</body>
<script>
	$(function(){
	var height = $(window).width()*0.3;
	$("img").height(height);
	$("img").width(height);
	
	});
	

</script>
</html>