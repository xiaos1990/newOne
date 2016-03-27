<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>home</title>
<style type="text/css">
 body {
	/* position: absolute; */
	/* top: 0;
	left: 0; */
	/* height: 100%;
	width: 100%;  */
	/* overflow-y:auto;
	overflow-x:auto;  */
	/* padding:20px; */
}


.header {
	top:1%;
	left:0;
	right:0;
/* 	bottom:95%; */
	/* height:10%; */
	border:1px solid green;
	align: center;
	text-align: center;
	background-color: white;
 	position: fixed; 
	z-index:1;
}

.MainContainer {
	/* height:90%;  */
	width:100%;
	border:3px solid red;
	margin-top: 18%; 
	text-align: center;
	align: center;
	background-color: gray;

}

.footer {
	height:10%;
	width:100%;
	border:3px solid red;
	align: center;
	text-align: center;
/* 	position: fixed; */
	bottom: 25px;
	background-color: white;
}

.page {

}
</style>
</head>
<body>
	<div class="page">
		<div class="header">
			<%@include file="head.jsp"%>
		</div>
		<div class="MainContainer">
 			<jsp:include page="body.jsp" />
			<%-- <%@include file="body.jsp"%> --%>
		</div>
		<div class="footer">
			 <jsp:include page="foot.jsp" />
			<%-- <%@include file="foot.jsp"%> --%>
		</div>
	</div>
</body>
</html>
