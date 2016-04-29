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
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/homepage.css" />
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
				<a href="${path }/" class="navbar-brand"><span class="glyphicon glyphicon-home"> </span><span class="hidden-sm hidden-xs homeLabel">&nbsp;cat&dog</span></a>
			</div>
			<div class="navbar-collapse collapse" id="mainMenu">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#home">Header</a></li>
					<li><a href="#content">Content</a></li>
					<li><a href="#foot">Footer</a></li>
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
							<li role="separator" class="divider"></li>
							<li><a href="#">Share House/Apartment (Owner)</a></li>		
							<li role="separator" class="divider"></li>
							<li><a href="#">Share House/Apartment (Finder)</a></li>			
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
								<span class="glyphicon glyphicon-user"><span class="homeLabel">${session_user.firstName }</span></span>
								</a>
								<ul class="dropdown-menu dropdown-menu-right aList">
									<li><a href="${path }/user/dashboard"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;Dashboard</a></li>
									<li><a href="${path }/user/properties"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;My Properties</a></li>
									<li><a href="${path }/user/favorite"><span class="glyphicon glyphicon-heart"></span>&nbsp;My Favorite</a></li>																	
									<li><a href="${path }/user/collection"><span class="glyphicon glyphicon-star"></span>&nbsp;My Collection</a></li>
									<li role="separator" class="divider"></li>
									<li id="logOff"><a href="${path}/user/signOff"><span class="glyphicon glyphicon-user"></span>&nbsp;Log Off</a></li>
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
								<span class="glyphicon glyphicon-user"><span class="homeLabel" id="userSpan"></span></span>
								</a>
								<ul class="dropdown-menu dropdown-menu-right aList">
									<li><a href="${path }/user/dashboard"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;Dashboard</a></li>
									<li><a href="${path }/user/properties"><span class="glyphicon glyphicon-piggy-bank"></span>&nbsp;My Properties</a></li>
									<li><a href="${path }/user/favorite"><span class="glyphicon glyphicon-heart"></span>&nbsp;My Favorite</a></li>																	
									<li><a href="${path }/user/collection"><span class="glyphicon glyphicon-star"></span>&nbsp;My Collection</a></li>
									<li role="separator" class="divider"></li>
									<li id="logOff"><a href="${path}/user/signOff"><span class="glyphicon glyphicon-user"></span>&nbsp;Log Off</a></li>
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

	<section id="home">
		<div class="filter">
			<div class="container">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<h1>Welcome to HomePage!</h1>
						<p>find roommates and new house</p>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="container" id="form">
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">

						<form class="form-inline">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">Address</div>
									<input type="text" class="form-control" id="address"
										placeholder="address">
								</div>
								<div class="input-group">
									<select class="form-control type" id="type">
										<option value="rent">Rent</option>
										<option value="buy">Buy</option>
										<option value="find">Find A Roommate</option>
									</select> <label class="sr-only" for="address">address </label>
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<span class="glyphicon glyphicon-search"> </span>&nbsp;GO!
										</button>
									</div>
								</div>


							</div>

						</form>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</section>
	
	<section id="content">
		<div class="container">
			<div class="row wow fadeInUp" data-wow-duration="1s">
				<div class="col-md-3"></div>
				<div class="col-md-4">
					<img class="img-responsive thumbnail" src="${path}/image/1.jpg">
				</div>
				<div class="col-md-2">
					<h3>Miami</h3>
					<p class="hidden visible-md visible-lg">
						1231 <br /> 123 <br /> 1231
					</p>

				</div>
				<div class="col-md-3"></div>
			</div>

		</div>
	</section>

	<section id="content1">
		<div class="container">
			
			<div class="row wow bounceIn" data-wow-duration="1s" >
				<div class="col-md-4">
					<a href="#"> <img class="img-responsive img-circle" src="${path}/image/2.jpg">
					</a>
				</div>
				<div class="col-md-4">
					<a> <img class="img-responsive img-circle"
						src="${path}/image/3.jpeg">
					</a>
				</div>
				<div class="col-md-4">
					<a> <img class="img-responsive img-circle" src="${path}/image/4.jpg">
					</a>
				</div>
			
			</div>
		</div>
	</section>

	<section id="content2">
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<a> <img class="img-responsive img-circle" src="${path}/image/2.jpg">
					</a>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<a> <img class="img-responsive img-circle" src="${path}/image/4.jpg">
					</a>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-2">
					<a> <img class="img-responsive img-circle" src="${path}/image/4.jpg">
					</a>
				</div>

			</div>
		</div>
	</section>


	<section id="content3">
		<div class="container-fluid">
			<div class="row">

				<div id="flip" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#flip" data-slide-to="0" class="active"></li>
						<li data-target="#flip" data-slide-to="1"></li>
						<li data-target="#flip" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="${path}/image/flip1.jpg" alt="MIAMI">
							<div class="carousel-caption">MIAMI</div>
						</div>
						<div class="item">
							<img src="${path}/image/flip2.jpg" alt="MIAMI">
							<div class="carousel-caption">MIAMI</div>
						</div>
						<div class="item">
							<img src="${path}/image/flip3.jpg" alt="MIAMI">
							<div class="carousel-caption">MIAMI</div>
						</div>
					</div>
					<a class="left carousel-control" href="#flip" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#flip" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
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


	<!-- sign in -->
<div class="modal fade" id="signIn" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" id="signInModal">
        <button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Sign In</h3>
      </div>
      <div class="modal-body">
					<form action="" method="post" id="signInForm">
						<div class="form-group  has-feedback">
						<input	type="email" name="email" class="form-control" id="email1" placeholder="Email">
						 <span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="form-group  has-feedback">
					<input type="password" name="password" class="form-control" id="password1" placeholder="Password" >
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>	
						<div class="form-group row">
							<div class="checkbox col-xs-6">
   							 <label>
      							<input type="checkbox" name="rememberMe" id="rememberMe" value="on"> Remember me?
   							 </label>
   							 </div>
   							 <div class="col-xs-6">  							 
							<a href="#" class="pull-right">Forgot password?</a>
							</div>
						</div>
						<div class="form-group">
						<input type="hidden" name="pathName" value="" />		
						<button type="submit" id="signInButton" class="btn btn-primary btn-block">Sign In</button>
						</div>
					</form>
				</div>
      <div class="modal-footer">
       <span class="pull-left">Don’t have an account?</span>
        <button type="button" class="btn btn-primary btn-right" data-toggle="modal" data-dismiss="modal" data-target="#signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>

<!-- sign up -->
<div class="modal fade" id="signUp" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" id="signUpModal">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Sign Up</h3>
      </div>
      <div class="modal-body">
					<form action="" method="post" id="signupForm">
						<div class="form-group  has-feedback">
						<input	type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name"  required pattern="[A-Za-z]+" data-toggle="tooltip" data-placement="top" title="First Name is Required!">
						<!-- <input	type="text" class="form-control" name="firstName" id="firstName" placeholder="First Name" data-toggle="tooltip" data-placement="top" title="First Name is Required!"> -->
						 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="form-group  has-feedback">
						<input	type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name" required pattern="[A-Za-z]+" data-toggle="tooltip" data-placement="top" title="Last Name is Required!">
						<!-- <input	type="text" class="form-control" name="lastName" id="lastName" placeholder="Last Name" data-toggle="tooltip" data-placement="top" title="Last Name is Required!"> -->
						 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
						</div>
						
						<div class="form-group  has-feedback">
						<input	type="email" class="form-control" name="email" id="email" placeholder="Email" required data-toggle="tooltip" data-placement="top" title="Email is Required! Example:xxx@xxx.com">
						<!-- <input	type="text" class="form-control" name="email" id="email" placeholder="Email"  data-toggle="tooltip" data-placement="top" title="Email is Required! Example:xxx@xxx.com"> -->
						 <span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
						</div>						
						<div class="form-group  has-feedback">
						<input type="password" class="form-control" name="password" id="password" placeholder="Password" required data-toggle="tooltip" data-placement="top" title="Password is Required!format:10-20 characters " pattern="\w{10,20}">
						<!-- <input type="password" class="form-control" name="password" id="password" placeholder="Password"  data-toggle="tooltip" data-placement="top" title="Password is Required!format:10-20 characters"> -->
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>	
						<div class="form-group  has-feedback">
						<input	type="text" class="form-control" name="phone" id="mobile" placeholder="Mobile" pattern="\d{10}" required data-toggle="tooltip" data-placement="top" title="Mobile is Required! format:10 numbers" pattern="\d{10}">
					<!-- 	<input	type="text" class="form-control" name="phone" id="mobile" placeholder="Mobile" data-toggle="tooltip" data-placement="top" title="Mobile is Required! format:10 numbers"> -->
						 <span class="glyphicon glyphicon-phone form-control-feedback" aria-hidden="true"></span>
						</div>	

						<button type="button" id="signUpButton" class="btn btn-primary btn-block">Sign Up</button>
					</form>
				</div>
      <div class="modal-footer">
       <span class="pull-left">Already a member?</span>
        <button type="button" class="btn btn-primary btn-right" data-toggle="modal" data-dismiss="modal" data-target="#signIn">Sign In</button>
      </div>
    </div>
  </div>
</div>

	<script src="${path}/js/jquery-1.12.2.js"></script>
	<script src="${path}/js/bootstrap.min.js"></script>
	<script src="${path}/js/jquery.singlePageNav.min.js"></script>
	<script src="${path}/js/wow.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
	<script src="${path}/js/blusky.js"></script>
	<script>
	</script>
</body>

</html>