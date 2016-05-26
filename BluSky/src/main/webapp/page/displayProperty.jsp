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
<link rel="stylesheet" href="${path}/css/propertyupload.css" />
<link rel="stylesheet" href="${path}/css/animate.css" />
<link rel="stylesheet" href="${path}/css/bootstrap-slider.css" />
<!-- 

<style>
.main {
	border-bottom: dashed blue 0.5px;
	/*border-right: solid blue 0.1px; */
}

.formDiv {
	width: 100%;
	text-align: center;
	align: center;
	/* 	background-color: rgb(240, 255, 255); */
}

.spacer {
	border-top: double gray;
	height: 2px;
	width: 100%;
}

.innerTextDiv {
	float: left;
	/* margin-right:5%;  */
	color: black;
}

body {
	margin-left: 10%;
	margin-right: 10%;
}

#googleMap {
	float: left;
	/* left:52%;
right:10%; */
	width: 38%;
	height: 800px;
	border: solid;
}

#map {
	width: 100%;
	height: 100%;
}
</style> -->
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
				<ul class="nav navbar-nav navbar-right">
					<li role="presentation" class="dropdown" id="dropDownProperty">
						<a class="dropdown-toggle skipThis" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"> Property<span class="caret"></span></a>
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
					<li role="presentation" class="dropdown" id="dropDownAgent">
						<a class="dropdown-toggle skipThis" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Agent<span class="caret"></span></a>
						<ul class="dropdown-menu dropdown-menu-left aList">
							<li><a href="${path }/agencycreate">Become Agent</a></li>
							<li><a href="#">Find Agent</a></li>		
						</ul>
					</li>				
					<li role="presentation" class="dropdown" id="dropDownLog">
						<a class="dropdown-toggle btn-lg skipThis" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span></a>
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


<section id="displayForm" >	
		<div class="container-fluid">
			<div class="row">		
				<div class="col-md-6">	
					<div id="filterDiv">
						<form action="${path }/property/upload" method="post" id="propertyForm" class="form-horizontal" >
							<div class="form-group  has-feedback" >
								<label class="col-sm-2 control-label" for="filterAddress">Address</label>
								<div class="col-sm-10">
									<input type="text" name="address" class="form-control"
										id="address" placeholder="search address" value="${saddress }" />
								</div>
							</div>
							<div class="form-group  has-feedback" >
								<label class="col-sm-2 control-label" for="type">Type</label>
								<div class="col-sm-4">
										<label class="checkbox-inline">
											<input type="radio" name="type" value="RENT" <c:if test="${stype =='RENT' }">checked </c:if>>Rent
										</label>
										<label class="checkbox-inline">
											<input type="radio" name="type" value="SELL" <c:if test="${stype =='SELL' }">checked </c:if>>Buy
										</label>
										<label class="checkbox-inline">
											<input type="radio" name="type" value="SHARE" <c:if test="${stype =='SHARE' }">checked </c:if>>Shared
										</label>
								</div>
								<div class="col-sm-1"></div>
								<label class="col-sm-2 control-label" for="type">Property Type</label>
								<div class="col-sm-3">
										<label class="checkbox-inline">
											<input type="checkbox" name="propertyType" value="APARTMENT" checked>Apartment
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="propertyType" value="HOUSE" checked>House
										</label>
								</div>
							</div>
							
							<div class="form-group  has-feedback" >
								<label class="col-sm-2 control-label" for="price">Price</label>
								<div class="col-sm-10 adjustSlider">
								
<div class="<c:if test="${stype !='SELL' }">fade </c:if>" id="buyDiv">							 
<b>0&nbsp;&nbsp;</b><input id="ex1" type="text"  value="" data-slider-min="0" data-slider-max="1000000" data-slider-step="1000" data-slider-value="[0,500000]"/><b>&nbsp;&nbsp;$1,000,000+</b>
</div>	
<div  class="<c:if test="${stype =='SELL' }">fade </c:if>" id="rentDiv">						 
<b>0&nbsp;&nbsp;</b><input id="ex2" type="text"  value="" data-slider-min="0" data-slider-max="5000" data-slider-step="5" data-slider-value="[0,2500]"/><b>&nbsp;&nbsp;$5,000+</b>
</div>	

								</div>
							</div>								
						</form>
					</div>
					<div id="content">
				<%-- 	<c:forEach var="prop" items="${list }">
					<div class="col-md-6">					
							<div class="panel panel-default">
								<div class="panel-heading photo-panel">
									<c:choose>
									<c:when test="${fn:length(prop.files) eq '0'}"><a href="/BluSky/property/displayDetails/${prop.id}"><img src="${path}/image/cute.jpg" class="img-responsive" alt="photo"/></a>
									</c:when>
									<c:when test="${fn:length(prop.files) eq '1'}">
									<c:forEach var="oneFile" items="${prop.files }" >
									<a href="/BluSky/property/displayDetails/${prop.id}"><img src="${(oneFile.address)}" class="img-responsive" alt="photo"/></a>
									</c:forEach>
									</c:when>
									<c:otherwise>
										<div id="flip${propStatus.index}" class="carousel slide" data-ride="carousel">
											<div class="carousel-inner" role="listbox">	
												<c:forEach var="file" items="${prop.files}" varStatus="status">
													<div class="item  <c:if test="${status.index =='0' }">active</c:if>" >
														<a href="/BluSky/property/displayDetails/${prop.id}"><img src="${file.address}" class="img-responsive" alt="MIAMI"></a>									
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
								<div class="panel-body"><h3>Shuai</h3><a> View Profile</a><br /><a> Edit Profile</a></div>
							</div>						
					</div>
					</c:forEach> --%>
					</div>			
				</div>
				<div class="col-md-6">
					<div id="map">							
					</div>					
				</div>
			</div>
		</div>
</section>

	<%-- <div>
		<div style="float: left; width: 50%; height:800px; overflow-y: scroll">
			<div class="formDiv">

				<!-- <label for="address">Address:</label> <input type="text"
					name="address" id="address" placeholder="input an address"
					onchange="codeAddress();ajaxCall();" /> -->
					<label for="address">Address:</label> <input type="text"
					name="address" id="address" placeholder="input an address"
					 /> 
					 <label for="propertyType">Property
					Type:</label> <select name="propertyType" id="propertyType">
					<option value="" label="--Please Select--" />
					<c:forEach var="opts" items="${propertyForm.propertyTypeList}">
						<option value="${opts['REF_VALUE'] }">${opts['SHORT_DESCRIPTION'] }</option>
					</c:forEach>
				</select> <label for="type">Type:</label> <select name="type" id="type">
					<option value="" label="--Please Select--" />
					<c:forEach var="opts" items="${propertyForm.typeList}">
						<option value="${opts['REF_VALUE'] }">${opts['SHORT_DESCRIPTION'] }</option>
					</c:forEach>
				</select> <label for="price">Price:</label> <input id="price" name="price" />
				<label for="sortBy">Sort By:</label> <select name="sortBy"
					id="sortBy">
					<option value="price">price</option>
					<option value="distance">distance</option>
					<option value="postDate">post date</option>
				</select>
				<button>filter</button>
			</div>
			<div class="spacer"></div>
			<div id="content">
			<c:forEach var="properties" items="${list123}" varStatus="status">
				<a href="/BluSky/property/displayDetails/${properties.id}">
				<img src="${properties.files[0].address}" />
					<div class="innerTextDiv">
						<div style="float: left, text-align:left">
							<b>Address</b><br />${properties.address}</div>
						<div style="float: left, text-align:left">
							<b>city</b><br />${properties.city}</div>
						<div style="float: left, text-align:left">
							<b>state</b><br />${properties.state}</div>
						<div style="float: left, text-align:left">
							<b>zipCode</b><br />${properties.zipCode}</div>
						<div
							style="float: left, text-align:left; word-break: break-all; word-wrap: break-word;">
							<b>features</b><br />${properties.description}</div>
					</div> <!-- </div> -->
				</a>
			</c:forEach>
			</div>
		</div>
		<div id="googleMap">
			<div id="map"></div>
		</div>

	</div> --%>


		<script src="${path}/js/jquery-1.12.2.js"></script>
	<script src="${path}/js/bootstrap.min.js"></script>
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?v=3&libraries=places" async defer></script> -->
	 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	<script src="${path}/js/markerwithlabel.js"></script>
	<!-- <script src="http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerwithlabel/1.1.9/src/markerwithlabel.js"></script> -->
	
	<script src="${path}/js/bootstrap-slider.js"></script>
	<script src="${path}/js/displayProperty.js"></script>

</body>
<script>
	
</script>
</html>