<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c" %>
<%@taglib uri="/fn.tld" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Cat & Dog</title>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/properties.css" />
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
      <a class="navbar-brand" href="${path }/user/dashboard">Dashboard</a>
    </div>

    <div class="collapse navbar-collapse" id="userinfo">
      <ul class="nav navbar-nav">
        <li><a href="${path }/user/properties">My Properties</a></li>
        <li><a href="${path }/user/favorite">My Favorite</a></li>
        <c:if test="${session_user.isAgent eq '1' }">
        <li><a href="${path }/user/collection">My Collection</a></li>
        </c:if>
       	<li><a href="${path }/user/account">Account Setting</a></li>
       	<li><a href="${path }/user/subscription">Subscriptions</a></li>
      </ul>      
    </div>
  </div>
</nav>


<section>
	<div class="container">
		<div class="row">
			<c:choose>
			<c:when test="${empty session_user.properties }">
				no property yet!
			</c:when>
			<c:otherwise>
		
			<c:forEach var="prop" items="${properties }" varStatus="propStatus">
			
			<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading photo-panel">		
									
							<c:choose>
								<c:when test="${fn:length(prop.files) eq '0'}"><a href="${path }/property/edit/${prop.id}"><img src="${path}/image/cute.jpg" class="img-responsive" alt="photo"/></a>
								</c:when>
								<c:when test="${fn:length(prop.files) eq '1'}">
								<c:forEach var="oneFile" items="${prop.files }" >
								<a href="${path }/property/edit/${prop.id}"><img src="${(oneFile.address)}" class="img-responsive" alt="photo"/></a>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<div id="flip${propStatus.index}" class="carousel slide" data-ride="carousel">
										<div class="carousel-inner" role="listbox">	
											<c:forEach var="file" items="${prop.files}" varStatus="status">
												<div class="item  <c:if test="${status.index =='0' }">active</c:if>" >
													<a href="${path }/property/edit/${prop.id}"><img src="${file.address}" class="img-responsive" alt="MIAMI"></a>									
												</div>										
											</c:forEach>
										</div>
										<a class="left carousel-control" href="#flip${propStatus.index}" role="button" data-slide="prev">
											<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> 
										<a class="right carousel-control" href="#flip${propStatus.index}" role="button" data-slide="next">
											<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>																	
								</c:otherwise>
							</c:choose>																										
						</div>
						<div class="panel-body">${prop.address },${prop.city },${prop.state },${prop.zipCode },${prop.country }
							<div>${prop.description }</div>
						</div>
					</div>
				</div>											
			
			</c:forEach>			
			</c:otherwise>
			</c:choose>
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
	<script>
	</script>
</body>

</html>