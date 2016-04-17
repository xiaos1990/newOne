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
<link rel="stylesheet" href="${path}/css/agent.css" />
<%--<link rel="stylesheet" href="${path}/css/animate.css" /> --%>
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
					<li><a href="#home">Header</a></li>
					<li><a href="#content">Content</a></li>	
					<li><a href="#foot">Footer</a></li>
					<li role="presentation" class="dropdown" id="dropDownAgent"><a
						class="dropdown-toggle skipThis" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
						Agent<span class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-menu-left">
							<li><a href="${path }/agency/create">Become Agent</a></li>
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
								<ul class="dropdown-menu dropdown-menu-left">
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
								<ul class="dropdown-menu dropdown-menu-left">
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


	<%-- <div id="dialog-form">
		<form:form action="/BluSky/agency/signup" method="post"
			commandName="userBean"  >
			<fieldset>
				<legend>Sign Up Form</legend>
				<div id="errors"></div>
				<table style="margin: auto">
					<tr>
						<td><label for="email">email:</label></td>
						<td><form:input path="email" id="email"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="email" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="name">name:</label></td>
						<td><form:input path="name" id="name"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="name" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="password">password:</label></td>
						<td><form:password path="password" id="password"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="password" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="birthday">birthday:</label></td>
						<td><form:input path="birthday" id="birthday"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="birthday" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="phone">phone:</label></td>
						<td><form:input path="phone" id="phone"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="phone" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="address">address:</label></td>
						<td><form:input path="address" id="address"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="address" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="city">city:</label></td>
						<td><form:input path="city" id="city"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="city" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="zipCode">zipCode</label></td>
						<td><form:input path="zipCode" id="zipcode"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="zipCode" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for=state>state:</label></td>
						<td><form:select path="state" id="state"
								class="text ui-widget-content ui-corner-all">
								<form:option value="">--please select--</form:option>
								<c:forEach var="opts" items="${USstates}">
									<form:option value="${opts['value'] }">${opts['label'] }</form:option>
								</c:forEach>
							</form:select></td>
						<td><form:errors path="state" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="country">country:</label></td>
						<td><form:input path="country" id="country"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="country" cssClass="error" /></td>
					<td><input type="hidden" name="lat" id="lat" />
					<input type="hidden" name="lng" id="lng"/>
					</td>
					</tr>
					
					<tr>
						<!-- Allow form submission with keyboard without duplicating the dialog button -->
						<td colspan="2"><input type="button" class="btn"
							value="submit" onclick="codeAddress();"></td>

					</tr>
				</table>
			</fieldset>
		</form:form> --%>
		
		
		
<section id="form" >	
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">		
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Agent Form</h4></div>
						<div class="panel-body">										
							<form:form action="${path }/agency/signup" method="post" id="agentsignupForm" commandName="userBean" class="form-horizontal">
							
							<div class="form-group  has-feedback">
								
							 <label class="col-sm-3 control-label" for="firstName">First Name</label>
							
							<div class="col-sm-9">	
							<form:input	type="text" id="firstName" path="firstName" class="form-control"/>
							 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
							 </div>
							</div>
							
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="lastName">Last Name</label>
							 <div class="col-sm-9">
							<form:input	type="text" id="lastName" path="lastName" class="form-control"  />							
							 <span class="glyphicon glyphicon-user form-control-feedback" aria-hidden="true"></span>
							 </div>
							 
							</div>						
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="email">Email</label>
							 <div class="col-sm-9">
							<form:input	type="email" path="email" class="form-control"  id="email" placeholder="Email" required data-toggle="tooltip" data-placement="top" title="Email is Required! Example:xxx@xxx.com" />
							 <span class="glyphicon glyphicon-envelope form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
																		
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="mobile">Phone</label>
							 <div class="col-sm-9">
							<form:input	type="text" path="phone" class="form-control"  id="mobile" placeholder="Mobile"  required data-toggle="tooltip" data-placement="top" title="Mobile is Required! format:10 numbers" />
							 <span class="glyphicon glyphicon-phone form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="lastName">Birthday</label>
							 <div class="col-sm-9">
							<form:input	type="date" path="birthday" class="form-control"  id="birthday" placeholder="birthday"  required data-toggle="tooltip" data-placement="top" title="birthday is Required! format:mm/dd/yyyy" />
							 <span class="glyphicon glyphicon-calendar form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
							
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="address">Address</label>
							 <div class="col-sm-9">
							<form:input	type="text" path="address" class="form-control"  id="address" placeholder="address" required data-toggle="tooltip" data-placement="top" title="address is Required!" />
							 <span class="glyphicon glyphicon-globe form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="city">City</label>
							 <div class="col-sm-9">
							<form:input	type="text" path="city" class="form-control"  id="city" placeholder="city" required data-toggle="tooltip" data-placement="top" title="city is Required!" />
							 <span class="glyphicon glyphicon-globe form-control-feedback" aria-hidden="true"></span>
							</div>	
							</div>
							<div class="form-group">
							 <label class="col-sm-3 control-label" for="state">State</label>
							 <div class="col-sm-9">
							<form:select type="text" id="state" path="state" class="form-control">
							 </form:select>							 
							</div>
							</div>
							<div class="form-group  has-feedback">
							 <label class="col-sm-3 control-label" for="zipCode">ZipCode</label>
							 <div class="col-sm-9">
							<form:input	type="text" path="zipCode" class="form-control" id="zipCode" placeholder="zipCode"  required data-toggle="tooltip" data-placement="top" title="zipCode is Required! format:5 numbers" />
							 <span class="glyphicon glyphicon-globe form-control-feedback" aria-hidden="true"></span>
							</div>
							</div>
							<div class="form-group">
							 <label class="col-sm-3 control-label" for="country">Country</label>
							 <div class="col-sm-9">
							<form:select type="text" id="country" path="country" class="form-control">
							 <option value="US">United States</option>
							 </form:select>
							</div>					
							</div>
							<input type="hidden" name="lat" id="lat"/>
							<input type="hidden" name="lng" id="lng" />
							<button type="button" id="signUpButton" class="btn btn-primary btn-block">Sign Up</button>
							</form:form>
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
	<script src="${path}/js/jquery.singlePageNav.min.js"></script>
<%-- 	<script src="${path}/js/wow.min.js"></script> --%>
	<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
	<script src="${path}/js/agent.js"></script>
</body>
<script>

</script>
</html>