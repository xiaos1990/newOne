<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script src="../js/jquery-1.12.2.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<title>home</title>
<style type="text/css">
body {
/* 	 position: absolute; 
	 top: 0;
	left: 0;  */
	/* height: 100%;
	width: 100%;  */
	overflow-y:auto;
	overflow-x:auto;  
	 padding:20px; 
	
}

.header {
	top: 1%;
	left: 0;
	right: 0;
	/* 	bottom:95%; */
	/* height:10%; */
	align: center;
	text-align: center;
	/* background-color: #222; */
	position: fixed;
	z-index: -1;
	padding: 10px;
}

.MainContainer {
	position: absolute;
	top: 6%;
	left: 0;
	right: 0;
	/* height:90%;  */
	/* width:100%; */
	/* border:3px solid red; */
	/* 	margin-top: 6%;  */
	text-align: center;
	align: center;
	text-align: center
}

.footer {
	/* height:10%;
	width:100%; */
	/* 	border:3px solid red; */
	align: center;
	text-align: center;
	/* 	position: fixed; */
	bottom: 25px;
	position: fixed;
	left: 0;
	right: 0;
}

.error{
	color:red;
}

#dialog-form {
	align: center;
	text-align: center;
	position: fixed;
	top: 20%;
	left: 40%;
	right: 40%;
	bottom: 20%;
	margin: auto;
	z-index: 1000;
	border: 1px solid black;
	 display:none; 
}
</style>
</head>
<body>
	<div class="page">
		<div class="header">
			<jsp:include page="head.jsp" />
		</div>
		<div class="MainContainer">
			<jsp:include page="body.jsp" />
			<div id="dialog-form" title="Create new user">
				<form:form action="/BluSky/user/signup" method="post"
					commandName="UserBean" cssId="signUpForm">
					<fieldset>
						<legend>Sign Up Form</legend>
						<div id="errors"></div>
						<table style="margin: auto">
							<tr>
								<td><label for="email">email:</label></td>
								<td><form:input  path="email" id="email"
										class="text ui-widget-content ui-corner-all" /></td>
								<%-- <td><form:errors path="email" cssClass="error" /></td> --%>
								<td><div style="display:none" name="email"></div></td>
							</tr>
							<tr>
								<td><label for="name">name:</label></td>
								<td><form:input  path="name" id="name"									
										class="text ui-widget-content ui-corner-all" /></td>
										<%-- <td><form:errors path="name" cssClass="error" /></td> --%>
											<td><div name="name"></div></td>
							</tr>
							<tr>
								<td><label for="password">password:</label></td>
								<td><form:input  path="password" id="password"									
										class="text ui-widget-content ui-corner-all" /></td>
										<%-- <td><form:errors path="password" cssClass="error" /></td> --%>
											<td><div  name="password"></div></td>
							</tr>
							<tr>
								<td><label for="birthday">birthday:</label></td>
								<td><form:input  path="birthday" id="birthday"										
										class="text ui-widget-content ui-corner-all" /></td>
										<%-- <td><form:errors path="birthday" cssClass="error" /></td> --%>
											<td><div  name="birthday"></div></td>
							</tr>
							<tr>
								<td><label for="phone">phone:</label></td>
								<td><form:input  path="phone" id="phone"
										class="text ui-widget-content ui-corner-all" /></td>
									<%-- 	<td><form:errors path="phone" cssClass="error" /></td> --%>
									<td><div name="phone"></div></td>
							</tr>
							<tr>
								<!-- Allow form submission with keyboard without duplicating the dialog button -->
								<td colspan="2"><input type="button"class="btn" value="submit"><input type="button" value="close" class="btn"></td>
							</tr>
						</table>
					</fieldset>
				</form:form>
			</div>
		</div>
		<div class="footer">
			<jsp:include page="foot.jsp" />
		</div>
	</div>



</body>
<script>
	$("#signinId").on("click", function() {
		window.location.href = "/BluSky/home/page";
	});
	
	$("#signupId").on("click", function() {	
			$("#dialog-form").show();
	});
	
	
	$("input:button[value='submit']").on("click", function() {
		$.ajax({
                cache: true,
                type: "POST",
                url:itle="/BluSky/user/signup",
                data:$('#signUpForm').serializeArray(),
                async: false,
                error: function(request) {
                    alert("Connection error");
                },
                success: function(data) {
                    if(data.success) {
                    console.log("success");
                }
                else {   
                 console.log("fail");               
                   	setData(data);
                    $("#errors").text(data.saveFail);
                }
            },
            });

	});
	
	
	
	$("input:button[value='close']").on("click", function() {
		$("#dialog-form").hide();
	});
	
	 function setData(data) {

        $.each(data,function(key, val) {
        console.log(data);
        console.log(key+":"+val);
           $("div[name='"+key+"']").text(val);
        });
    }
</script>

</html>
