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
	border: none;
	/* background-color: #222; */
	position: fixed;
	z-index: 100;
}

#body {
	margin-left: 10%;
	margin-right: 10%;
	border: none;
}

#foot {
	margin-left: 10%;
	margin-right: 10%;
	border: none;
}
</style>
</head>
<body>
	<div class="page">
		<div class="header">
			<iframe name="head" id="header" src="head.jsp" width="100%"
				height="100px"></iframe>
		</div>
		<div class="MainContainer">
			<iframe name="body" id="body" src="body.jsp" width="80%"
				height="1000px"></iframe>
		</div>
		<div class="footer">
			<iframe name="foot" id="foot" src="foot.jsp" width="80%"
				height="100px"></iframe>
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
			cache : true,
			type : "POST",
			url : itle = "/BluSky/user/signup",
			data : $('#signUpForm').serializeArray(),
			async : false,
			error : function(request) {
				alert("Connection error");
			},
			success : function(data) {
				if (data.success) {
					console.log("success");
				} else {
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

		$.each(data, function(key, val) {
			console.log(data);
			console.log(key + ":" + val);
			$("div[name='" + key + "']").text(val);
		});
	}
</script>

</html>
