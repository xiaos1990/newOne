<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Head</title>
<script src="../js/jquery-1.12.2.js"></script>
<script src="../js/bootstrap.min.js"></script>
<!-- <script src="../js/jquery-ui.min.js"></script> -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!--  <link rel="stylesheet" href="../css/jquery-ui.min.css"> -->
<style>
.logo {
	background-size: cover;
	overflow: hidden;
	width: 10%;
	margin-left: 10%;
	float: left;
}

.content {
	float: left;
	width: 65%;
	margin-right: 0;
}

</style>


</head>

<body>

	<div>
		<div class="logo">
			<a href="/BluSky/page/home.jsp" target="top"><img src="../image/page.jpg"
				style="width: 50px; height: 50px" /></a>
		</div>
		<div class="content">
			<nav class="navbar navbar-inverse">
				<div class="container-fluid">		
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="/BluSky/page/home.jsp" target="top">Home<span
									class="sr-only"></span></a></li>					
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Property<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/BluSky/property/newOne" target="body">Post Property</a></li>
									<li><a href="/BluSky/property/display" target="body">Display Property</a></li>
									<li><a href="#">Something else here</a></li>
									<!-- <li role="separator" class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">One more separated link</a></li> -->
								</ul></li>
							
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Service<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Find Rommate</a></li>
									<li><a href="#">Find Agent</a></li>
									<li><a href="#">Something else here</a></li>
									<!--<li role="separator" class="divider"></li>
								 	<li><a href="#">Separated link</a></li>
									<li role="separator" class="divider"></li>
									<li><a href="#">One more separated link</a></li> -->
								</ul></li>
						</ul>
						<form class="navbar-form navbar-left" role="search" action="" method="post">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="input address or zipcode">
							</div>
							<button type="submit" class="btn btn-default">Submit</button>
							<button type="button" class="btn btn-default" id="signinId">Sign In</button>
							<button type="button" class="btn btn-default" id="signupId">Sign Up</button>
						</form>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
	</div>


</body>
<script>
 $("#signupId").on("click",function(){


window.parent.frames["body"].location.href="/BluSky/user/register"; 
/*  var frame =  window.parent.frames["body"];
 frame.src='/BluSky/user/register'; */
/*parent.location.reload; */

 
	
}); 
</script>
</html>
