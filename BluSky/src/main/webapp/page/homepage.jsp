<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cat & Dog</title>
<link rel="stylesheet" href="../css/bluesky.css" />
<link rel="stylesheet" href="../css/homepage.css" />
<link rel="stylesheet" href="../css/animate.css" />
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
				<a href="#" class="navbar-brand">Cat & Dog</a>
			</div>
			<div class="navbar-collapse collapse" id="mainMenu">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#home">Home</a></li>
					<li><a href="#content">content</a></li>
					<li><a href="#content1">content1</a></li>
					<li><a href="#content2">content2</a></li>
					<li><a href="#content3">content3</a></li>
					<li><a href="#content4">foot</a></li>
					<li><a href="#"  data-toggle="modal" data-target="#signIn">Sign In</a></li>
					<li><a href="#"  data-toggle="modal" data-target="#signUp">Sign Up</a></li>
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
										placeholder="input location">
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
					<img class="img-responsive thumbnail" src="../image/1.jpg">
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
					<a href="#"> <img class="img-responsive img-circle" src="../image/2.jpg">
					</a>
				</div>
				<div class="col-md-4">
					<a> <img class="img-responsive img-circle"
						src="../image/3.jpeg">
					</a>
				</div>
				<div class="col-md-4">
					<a> <img class="img-responsive img-circle" src="../image/4.jpg">
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
					<a> <img class="img-responsive img-circle" src="../image/2.jpg">
					</a>
				</div>
				<div class="col-md-2"></div>
				<div class="col-md-2">
					<a> <img class="img-responsive img-circle" src="../image/4.jpg">
					</a>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-2">
					<a> <img class="img-responsive img-circle" src="../image/4.jpg">
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
							<img src="../image/flip1.jpg" alt="MIAMI">
							<div class="carousel-caption">MIAMI</div>
						</div>
						<div class="item">
							<img src="../image/flip2.jpg" alt="MIAMI">
							<div class="carousel-caption">MIAMI</div>
						</div>
						<div class="item">
							<img src="../image/flip3.jpg" alt="MIAMI">
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

	<section id="content4">
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
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Sign In</h3>
      </div>
      <div class="modal-body">
					<form action="" method="post">
						<div class="form-group  has-feedback"">
						<input	type="email" class="form-control" id="email" placeholder="Email">
						 <span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="form-group  has-feedback">
					<input type="password" class="form-control" id="password" placeholder="Password" >
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>	
						<div class="form-group pull-right">
							<a href="#" >Forgot password?</a>
						</div>		
						<button type="submit" class="btn btn-primary">Sign In</button>
					</form>
				</div>
      <div class="modal-footer">
       <span class="pull-left">Don’t have an account?</span>
        <button type="button" class="btn btn-primary btn-left" data-toggle="modal" data-dismiss="modal" data-target="#signUp">Sign Up</button>
      </div>
    </div>
  </div>
</div>

<!-- sign up -->
<div class="modal fade" id="signUp" tabindex="-1" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title">Sign Up</h3>
      </div>
      <div class="modal-body">
					<form action="" method="post">
						<div class="form-group  has-feedback">
						<input	type="text" class="form-control" id="firstName" placeholder="First Name" required pattern="[A-Za-z]+" data-toggle="tooltip" data-placement="top" title="First Name is Required!">
						 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="form-group  has-feedback">
						<input	type="text" class="form-control" id="lastName" placeholder="Last Name" required pattern="[A-Za-z]+" data-toggle="tooltip" data-placement="top" title="Last Name is Required!">
						 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
						</div>
						
						<div class="form-group  has-feedback">
						<input	type="email" class="form-control" id="email" placeholder="Email" required data-toggle="tooltip" data-placement="top" title="Email is Required! Example:xxx@xxx.com">
						 <span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
						</div>						
						<div class="form-group  has-feedback">
						<input type="password" class="form-control" id="password" placeholder="Password" required data-toggle="tooltip" data-placement="top" title="Password is Required!format:10-20 characters " pattern="\w{10,20}">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>	
						<div class="form-group  has-feedback">
						<input	type="telephone" class="form-control" id="mobile" placeholder="Mobile" pattern="\d{10}" required data-toggle="tooltip" data-placement="top" title="Mobile is Required! format:10 numbers" pattern="\d{10}">
						 <span class="glyphicon glyphicon-phone form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="form-group pull-right">
							<a href="#" >Forgot password?</a>
						</div>		
						<button type="submit" class="btn btn-primary">Sign Up</button>
					</form>
				</div>
      <div class="modal-footer">
       <span class="pull-left">Already a member?</span>
        <button type="button" class="btn btn-primary btn-left" data-toggle="modal" data-dismiss="modal" data-target="#signIn">Sign In</button>
      </div>
    </div>
  </div>
</div>

	<script src="../js/jquery-1.12.2.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.singlePageNav.min.js"></script>
	<script src="../js/wow.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
	<script>
		$(function(){
			$(".nav").singlePageNav({offset:60});
  		    $('[data-toggle="tooltip"]').tooltip();
  		    $(".navbar-collapse a").on("click",function(){
  		    $('.collapse').collapse("hide");
  		    });
		});
	
	function initialize() {		
	var input = document.getElementById('address');
    new google.maps.places.SearchBox((input));
   }
		new WOW().init();
	</script>
</body>

</html>