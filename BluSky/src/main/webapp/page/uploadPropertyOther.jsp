<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Agent Sign Up</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/propertyupload.css" />
<style>


</style>

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
				<a href="${path }" class="navbar-brand"><span class="glyphicon glyphicon-home"> </span>&nbsp;Cat & Dog</a>
			</div>
			<div class="navbar-collapse collapse" id="mainMenu">
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
					
							<li role="presentation" class="dropdown" id="dropDownLog">
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
				</ul>
			</div>
		</div>
	</nav>

	
		
<section id="form" >	
		<div class="container">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">	
				<form:form action="${path }/property/upload" method="post"
								id="propertyForm" commandName="propertyBean"
								class="form-horizontal" enctype="multipart/form-data">	
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Property Information:</h4></div>
						<div class="panel-body">
							
 <%-- AJAX VALIDATION OR BACKEND VALIDATION 
 <div class="control-group ${requestScope['org.springframework.validation.BindingResult.user'].hasFieldErrors('firstName') ? 'error' : ''}"> --%>
 
 
								<%-- <div class="form-group  has-feedback">

									 <label class="col-sm-2 control-label" for="firstName">First Name</label>
							
							<div class="col-sm-10">	
							<form:input	type="text" id="firstName" path="firstName" class="form-control"/>
							 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
							 </div>
							</div>
							
							<div class="form-group  has-feedback">
							 <label class="col-sm-2 control-label" for="lastName">Last Name</label>
							 <div class="col-sm-10">
							<form:input	type="text" id="lastName" path="lastName" class="form-control"  />							
							 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
							 </div>
							 
							</div>						
							<div class="form-group  has-feedback">
							 <label class="col-sm-2 control-label" for="email">Email</label>
							 <div class="col-sm-10">
							<form:input	type="email" path="email" class="form-control"  id="email" placeholder="Email" required data-toggle="tooltip" data-placement="top" title="Email is Required! Example:xxx@xxx.com" />
							 <span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
																		
							<div class="form-group  has-feedback">
							 <label class="col-sm-2 control-label" for="mobile">Phone</label>
							 <div class="col-sm-10">
							<form:input	type="text" path="phone" class="form-control"  id="mobile" placeholder="Mobile"  required data-toggle="tooltip" data-placement="top" title="Mobile is Required! format:10 numbers" />
							 <span class="glyphicon glyphicon-phone form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
							<div class="form-group  has-feedback">
							 <label class="col-sm-2 control-label" for="lastName">Birthday</label>
							 <div class="col-sm-10">
							<form:input	type="date" path="birthday" class="form-control"  id="birthday" placeholder="birthday"  required data-toggle="tooltip" data-placement="top" title="birthday is Required! format:mm/dd/yyyy" />
							 <span class="glyphicon glyphicon-calendar form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div> --%>

									<div class="form-group  has-feedback">
										<label class="col-sm-2 control-label" for="address">Address</label>
										<div class="col-sm-10">
											<form:input type="text" path="address" class="form-control"
												id="address" placeholder="address" required
												data-toggle="tooltip" data-placement="top"
												title="address is Required!" />
											<span class="glyphicon glyphicon-globe form-control-feedback"
												aria-hidden="true"></span>
										</div>
									</div>
									<div class="form-group  has-feedback">
										<label class="col-sm-2 control-label" for="city">City</label>
										<div class="col-sm-10">
											<form:input type="text" path="city" class="form-control"
												id="city" placeholder="city" required data-toggle="tooltip"
												data-placement="top" title="city is Required!" />
											<span class="glyphicon glyphicon-globe form-control-feedback"
												aria-hidden="true"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="state">State</label>
										<div class="col-sm-10">
											<form:select class="form-control" type="text" id="state"
												path="state" >
												<c:forEach var="state" items="${states }">
													<form:option value="${state.key }">${state.value }</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
									<div class="form-group  has-feedback">
										<label class="col-sm-2 control-label" for="zipCode">ZipCode</label>
										<div class="col-sm-10">
											<form:input type="text" path="zipCode" class="form-control"
												id="zipCode" placeholder="zipCode" required
												data-toggle="tooltip" data-placement="top"
												title="zipCode is Required! format:5 numbers" />
											<span class="glyphicon glyphicon-globe form-control-feedback"
												aria-hidden="true"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="country">Country</label>
										<div class="col-sm-10">
											<form:select class="form-control" type="text" id="country"
												path="country" >
												<option value="US">United States</option>
											</form:select>
										</div>
									</div>
									<div class="form-group  has-feedback">
										<label class="col-sm-2 control-label" for="price">price</label>
										<div class="col-sm-10">
											<form:input type="text" path="price" class="form-control"
												id="zipCode" placeholder="price" required
												data-toggle="tooltip" data-placement="top"
												title="zipCode is Required! format:5 numbers" onchange="formatCurrency(this)"/>
											<span class="glyphicon glyphicon-usd form-control-feedback"
												aria-hidden="true"></span>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-2 control-label" for="country">Quality</label>
										<div class="col-sm-10">
											<form:select class="form-control" id="quality"
												path="quality" >
												<c:forEach var="qitem" items="${quality }">
													<form:option value="${qitem.REF_VALUE }">${qitem.SHORT_DESCRIPTION }</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
									
									<div class="form-group" id="files">
										<label class="col-sm-2 control-label" for="price">images/videos:</label>
										<div class="col-sm-10">
											<div class="input-group">
												<input type="file" name="btnFile" class="form-control"/>
												<div class="input-group-btn">
													<button type="button" class="btn btn-primary"
														onclick="addMore();">
														<span class="glyphicon glyphicon-open-file"> </span>&nbsp;Add More
													</button>
												</div>
											</div>
										</div>
									</div>
									<!-- <input type="button" value="submit" onclick="codeAddress();" /> -->


									<input type="hidden" name="lat" id="lat" /> <input
										type="hidden" name="lng" id="lng" />
									<button type="button" id="propertyButton"
										class="btn btn-primary btn-block">Submit</button>
							
						</div>
					</div>
					</form:form>
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
	<script src="${path}/js/jquery.singlePageNav.min.js"></script>
<%-- 	<script src="${path}/js/wow.min.js"></script> --%>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
	<script src="${path}/js/property.js"></script>
</body>

</html>