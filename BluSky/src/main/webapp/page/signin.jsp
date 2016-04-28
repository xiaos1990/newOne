<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User Sign In</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/signin.css" />
<%--<link rel="stylesheet" href="${path}/css/animate.css" /> --%>
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
				<a href="${path }" class="navbar-brand"><span class="glyphicon glyphicon-home"> </span>&nbsp;Cat & Dog</a>
			</div>
			<div class="navbar-collapse collapse" id="mainMenu">
				<ul class="nav navbar-nav navbar-right">
					<!-- <li><a href="#home">Header</a></li>
					<li><a href="#content">Content</a></li>	
					<li><a href="#foot">Footer</a></li> -->
					<li role="presentation" class="dropdown" id="dropDownProperty"><a
						class="dropdown-toggle skipThis" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">
						Property<span class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-menu-left aList">
							<li><a  href="${path }/property/create">Sell</a></li>
							<li><a  href="${path }/property/create">Lease</a></li>	
							<li><a href="#">Buy</a></li>	
							<li><a href="#">Rent</a></li>		
						</ul>
					</li>
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
							<!-- <li id="signInLi" ><a href="#" data-toggle="modal"
								data-target="#signIn">Sign In</a></li> -->
							<li id="signUpLi" ><a href="#" data-toggle="modal"
								data-target="#signUp">Sign Up</a></li>
						</c:otherwise>
					</c:choose>					
				</ul>
			</div>
		</div>
	</nav>


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
    </div>
  </div>
</div>
	 
		
		
		
<section id="form" >	
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">		
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Sign In</h4></div>
						<div class="panel-body">										
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
						<input type="hidden" name="pathName" value="${forward_page }" />		
						<button type="submit" id="signInButton" class="btn btn-primary btn-block">Sign In</button>
						</div>
					</form>
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

</body>
<script>


$.fn.serializeObject = function(){    
   			var o = {};    
  			var a = this.serializeArray();    
   			$.each(a, function() {    
       		if (o[this.name]) {    
           if (!o[this.name].push) {    
               o[this.name] = [o[this.name]];    
           }    
           o[this.name].push(this.value || '');    
       		} else {    
           o[this.name] = this.value || '';    
       		}    
  			 });    
  			 return o;    
		};  
		
	$(function(){
	
		$("#signInButton").on("click", function() {
				event.preventDefault();			
				var formData = JSON.stringify($('#signInForm').serializeObject());
			
				$.ajax({
					url : '/BluSky/user/signin',
					type : 'POST',
					contentType : 'application/json', 
					data : formData,
					cache : false,
					dataType : 'json'				
				}).done(function(data){		
					$("#message").remove();					
						 if(data.success == false){
							$("#email1").closest('div').addClass("has-error");			
							$("#password1").closest('div').addClass("has-error");										
							var div='<div class="alert alert-danger" id="message" role="alert">'+data.message+'</div>';
							$(div).insertAfter($('.panel-heading'));					
						}else{
						if($("#rememberMe").is(":checked")){	
							$('#signInForm').prop("action","/BluSky/user/signinSave");
							$('#signInForm').submit();
						}
						var pathname=$("input:hidden[name='pathName']").val();
							if(typeof pathname == 'undefined'){
							window.location.href="/";
							}else{
							/* if( pathname.split("/BluSky")[0] ==  '/property/upload')
								window.location.href=pathname.split("/BluSky")[0];
							else */
								window.location.href=pathname.split("/BluSky")[0];
							}
					}												
				})
				.fail(function(){
				console.log(arguments[1]);
				});
			}); 
			
			
			$("#signUpButton").on("click", function() {
				event.preventDefault();
				
				var formData = JSON.stringify($('#signupForm').serializeObject());
			
				$.ajax({
					url : '/BluSky/user/signup',
					type : 'POST',
					contentType : 'application/json', 
					data : formData,
					cache : false,
					dataType : 'json'				
				}).done(function(data){		
						$("#errorMessage").remove();
						if(data.success == false){
						$("#signupForm input").each(function(){
							var name = $(this).prop("name");					
						
							if(typeof data[name] != 'undefined'){
							$(this).closest('div').addClass("has-error");
							$(this).closest('div').removeClass("has-success");
							
							}else{
							$(this).closest('div').addClass("has-success");
							$(this).closest('div').removeClass("has-error");
								
							}
							});
						};
						 if(data.dumplicateEmail == true){
							$("#email").closest('div').addClass("has-error");						
							var div='<div class="alert alert-danger" id="errorMessage" role="alert">'+data.email+'</div>';
							$('#signUpModal').append(div);
						
						};
						if(data.success == true){
							$("#signUp").modal('hide');
							var pathname=$("input:hidden[name='pathName']").val();
							if(typeof pathname == 'undefined'){
							window.location.href="/";
							}else{
							window.location.href=pathname.split("/BluSky")[0];
							}
						}
						
				})
				.fail(function(){
				console.log(arguments[1]);
				});
			});
			
		});

</script>
</html>