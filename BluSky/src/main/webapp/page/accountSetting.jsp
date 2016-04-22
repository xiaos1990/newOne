<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cat & Dog</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/dashboard.css" />
<link rel="stylesheet" href="${path}/css/animate.css" />
</head>

<body onload="initialize();">

	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#mainMenu">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="${path }" class="navbar-brand"><span class="glyphicon glyphicon-home"> </span></a>
			</div>
			<div class="navbar-collapse collapse" id="mainMenu">
				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" id="address" placeholder="Search">
						<div class="input-group-btn">
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"> </span>&nbsp;Submit
							</button>
						</div>
					</div>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation" class="dropdown" id="dropDownProperty"><a
						class="dropdown-toggle skipThis" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
						Property<span class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-menu-left aList">
							<li><a  href="${path }/property/create/1">Sell/Rent House/Apartment</a></li>
							<li><a  href="${path }/property/create/2">Sell Other</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Buy House/Apartment</a></li>
							<li><a href="#">Buy Other</a></li>	
							<li role="separator" class="divider"></li>
							<li><a href="#">Rent</a></li>		
						</ul>
					</li>
					<li role="presentation" class="dropdown" id="dropDownAgent"><a
						class="dropdown-toggle skipThis" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
						Agent<span class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-menu-left aList">
							<li><a href="${path }/agencycreate">Become Agent</a></li>
							<li><a href="#">Find Agent</a></li>		
						</ul>
					</li>
					<c:choose>
						<c:when test="${not empty session_user}">
							<li role="presentation" class="dropdown" id="dropDownLog">
								<a class="dropdown-toggle btn-lg skipThis"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false"> 
								<span class="glyphicon glyphicon-user"></span>
								</a>
								<ul class="dropdown-menu dropdown-menu-left aList">
									<li><a href="#"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;Dashboard</a></li>
									<li><a href="#">Wish List</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li id="logOff"><a href="${path}/user/signOff">Log Off</a></li>
								</ul>
							</li>
							<li id="signInLi" class="hide"><a href="#" data-toggle="modal"
								data-target="#signIn">Sign In</a></li>
							<li id="signUpLi" class="hide"><a href="#" data-toggle="modal"
								data-target="#signUp">Sign Up</a></li>
						</c:when>
						<c:otherwise>
							<li role="presentation" class="dropdown hide" id="dropDownLog">
								<a class="dropdown-toggle btn-lg skipThis"
								data-toggle="dropdown" href="#" role="button"
								aria-haspopup="true" aria-expanded="false"> 
								<span class="glyphicon glyphicon-user"></span>
								</a>
								<ul class="dropdown-menu dropdown-menu-left aList">
									<li><a href="#">Wish List</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li id="logOff"><a href="${path}/user/signOff">Log Off</a></li>
								</ul>
							</li>
							<li id="signInLi" ><a href="#" data-toggle="modal"
								data-target="#signIn">Sign In</a></li>
							<li id="signUpLi" ><a href="#" data-toggle="modal"
								data-target="#signUp">Sign Up</a></li>
						</c:otherwise>
					</c:choose>					
				</ul>
			</div>
		</div>
	</nav>




<nav class="navbar navbar-inverse userNav">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#userinfo" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${path }/page/dashBoard.jsp">Dashboard</a>
    </div>

    <div class="collapse navbar-collapse" id="userinfo">
      <ul class="nav navbar-nav">
        <li><a href="#">Favorite List</a></li>
       	<li><a href="${path }/page/accountSetting.jsp">Account Setting</a></li>
       	<li><a href="#">Subscriptions</a></li>
      </ul>      
    </div>
  </div>
</nav>

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
					<div class="panel panel-default">
						<div class="panel-heading photo-panel"><img src="${path}/image/cute.jpg" class="img-responsive" alt="photo"/></div>
						<div class="panel-body"><h3>Shuai</h3><a> View Profile</a><br /><a> Edit Profile</a></div>
					</div>	
					<div class="panel panel-default">
						<div class="panel-heading">Verifications</div>
						<div class="panel-body"><h3>Shuai</h3><a> View Profile</a><br /><a> Edit Profile</a></div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Quick Links</div>
						<div class="panel-body"><h3>Shuai</h3><a> View Profile</a><br /><a> Edit Profile</a></div>
					</div>
							
			</div>
			<div class="col-md-9">
					<div class="panel panel-default">
						<div class="panel-heading">Quick Links</div>
						<div class="panel-body">
							message...........
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Quick Links</div>
						<div class="panel-body">
							message...........
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">Quick Links</div>
						<div class="panel-body">
							message...........
						</div>
					</div>
				</div>
		</div>
	</div>
</section>
	<section id="foot">
		<div class="container-fluid">
			<div class="row">
				<h1>TO BE CONTINUE!</h1>
			</div>
		</div>
	</section>

	<script src="${path}/js/jquery-1.12.2.js"></script>
	<script src="${path}/js/bootstrap.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
	<script src="${path}/js/blusky.js"></script>
</body>

</html>