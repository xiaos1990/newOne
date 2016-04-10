<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cat & Dog</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/homepage.css" />
</head>

<body>

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
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
					<li><a href="#">Home</a></li>
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
			<div class="row">
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
			<div class="row">
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

	<script src="../js/jquery-1.12.2.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script>
		
	</script>
</body>

</html>