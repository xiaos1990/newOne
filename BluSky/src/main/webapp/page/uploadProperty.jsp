<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<title>Property - Upload</title>
<link rel="shortcut icon" href="${path}/image/bitbug_favicon.ico" /> 
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/propertyupload.css" />
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
<section id="form" >	
		<div class="container-fluid">
			<div class="row">		
				<div class="col-md-6">	
				<form:form action="${path }/property/upload" method="post" id="propertyForm" commandName="propertyBean" class="form-horizontal" enctype="multipart/form-data">	
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Property Information:</h4></div>
						<div class="panel-body">
									<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('address')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="address">Address</label>
										<div class="col-sm-10">
											<form:input type="text" path="address" class="form-control" id="address" placeholder="address" data-toggle="tooltip" data-placement="top" title="address is Required!" />
											<span class="glyphicon glyphicon-globe form-control-feedback" aria-hidden="true"></span>
											<input type="hidden" id="addressHidden" value="${propertyBean.address }" />
										</div>
									</div>
									<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('city')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="city">City</label>
										<div class="col-sm-10">
											<form:input type="text" path="city" class="form-control" id="city" placeholder="city" required data-toggle="tooltip" data-placement="top" title="city is Required!" />
											<span class="glyphicon glyphicon-globe form-control-feedback" aria-hidden="true"></span>
										</div>
									</div>
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('state')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="state">State</label>
										<div class="col-sm-10">
											<form:select class="form-control" type="text" id="state" path="state" >
													<c:forEach var="state" items="${states }">
													<form:option value="${state.key }">${state.value }</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('zipCode')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="zipCode">ZipCode</label>
										<div class="col-sm-10">
											<form:input type="text" path="zipCode" class="form-control" id="zipCode" placeholder="zipCode" data-toggle="tooltip" data-placement="top" title="zipCode is Required! format:5 numbers" />
											<span class="glyphicon glyphicon-globe form-control-feedback" aria-hidden="true"></span>
										</div>
									</div>
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('country')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="country">Country</label>
										<div class="col-sm-10">
											<form:select class="form-control" type="text" id="country" path="country" >
												<option value="US">United States</option>
											</form:select>
										</div>
									</div>

										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('type')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="type">Type</label>
										<div class="col-sm-10">
											<form:select class="form-control" path="type" id="type" onchange="flipLeaseInfo(this)">
												<c:forEach var="type" items="${property_type_owner }">
													<form:option value="${type.REF_VALUE }">${type.SHORT_DESCRIPTION }</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>

										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('propertyType')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="propertyType">Property Type</label>
										<div class="col-sm-10">
											<form:select class="form-control" path="propertyType">
												<c:forEach var="ptype" items="${propertyTypes }">
													<form:option value="${ptype['REF_VALUE'] }">${ptype['SHORT_DESCRIPTION'] }</form:option>
												</c:forEach>
											</form:select>
										</div>
									</div>
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('baths')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="baths">baths</label>
										<div class="col-sm-10">
											<form:input type="text" path="baths" class="form-control" id="zipCode" placeholder="bath" data-toggle="tooltip" data-placement="top" title="baths is Required!" onchange="validateNumber(this)" />
										</div>
									</div>

										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('beds')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="beds">beds</label>
										<div class="col-sm-10">
											<form:input type="text" path="beds" class="form-control" id="zipCode" placeholder="beds" data-toggle="tooltip" data-placement="top" title="beds is Required!" onchange="validateNumber(this)" />
											<span class="glyphicon glyphicon-bed form-control-feedback" aria-hidden="true"></span>
										</div>
									</div>
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('size')?'has-error':'' }">
										<label class="col-sm-2 col-xs-12 control-label" for="size">size</label>
										<div class="col-sm-8 col-xs-9">
											<form:input type="text" path="size" class="form-control" id="zipCode" placeholder="size" data-toggle="tooltip" data-placement="top" title="size is Required!" onchange="validateNumber(this)" />
										</div>
										<div class="col-sm-2 col-xs-3">
												<select name="unit" class="form-control">
												<option value="1">ft²</option>
												<option value="2">m²</option>
											</select>
										</div>
										
									</div>
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('price')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="price">price</label>
										<div class="col-sm-10">
											<form:input type="text" path="price" class="form-control" id="zipCode" placeholder="price" data-toggle="tooltip" data-placement="top" title="price is Required!" onchange="formatCurrency(this)"/>
											<span class="glyphicon glyphicon-usd form-control-feedback" aria-hidden="true"></span>
										</div>
									</div>
																			
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('leaseDetails')?'has-error':'' }" id="leaseDetails">
										<label class="col-sm-2 control-label" for="Lease Details">Lease Details:</label>
										<div class="col-sm-10">										
											<c:forEach var="detail" items="${leaseList }">
												<label class="checkbox-inline">
													 <input type="checkbox" name="leaseDetails" value="${detail.SHORT_DESCRIPTION }" <c:forEach var="lease" items="${leaseDetails }"><c:if test="${detail.SHORT_DESCRIPTION eq lease }">checked</c:if></c:forEach>>${detail.SHORT_DESCRIPTION }
												</label>							 
											</c:forEach>
										</div>
									</div>

										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('amenities')?'has-error':'' }">
										<label class="col-sm-2 control-label" for="Amenities">Amenities</label>
										<div class="col-sm-10">
											<c:forEach var="amenity" items="${amenityList }">
												<label class="checkbox-inline">
														 <input type="checkbox" name="amenities" value="${amenity.REF_VALUE }" <c:forEach var="amenityResult" items="${amenities }"><c:if test="${amenity.REF_VALUE eq amenityResult }">checked</c:if>	</c:forEach>>${amenity.SHORT_DESCRIPTION }
												</label>
											</c:forEach>
										</div>
										</div>									
										<div class="form-group ">
										<label class="col-sm-2 control-label" for="description">Description</label>
										<div class="col-sm-10">							
											<form:textarea maxlength="5000" path="description" class="form-control" id="description" placeholder="description(optional)" data-toggle="tooltip" data-placement="top" title="Extra Information about your property!"  />											
										</div>
									</div>

										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('files')?'has-error':'' }" id="files">
										<label class="col-sm-2 control-label" for="file">images/videos:</label>
										<div class="col-sm-10">
											<div class="input-group">
												<input type="file" name="btnFile" class="form-control" data-toggle="tooltip" data-placement="top" title="jpg,jpng,png,mp4 only max size 10MB per one!"  />
												<div class="input-group-btn">
													<button type="button" class="btn btn-primary" onclick="addMore();">
														<span class="glyphicon glyphicon-open-file"> </span>&nbsp;Add More
													</button>
												</div>
											</div>																						
										</div>
								<%-- 	<c:forEach var="file" items="${btnFile }" begin='1'> 
									<div class="files">
										<div class="col-sm-2"></div>
										<div class="col-sm-10">
											<div class="input-group" id="files">
												<input type="file" name="btnFile" class="form-control" value="${file}" />
												<div class="input-group-btn">
													<button type="button" class="btn btn-default"
														onclick="deleteThis(this);">
														<span class="glyphicon glyphicon-trash"> </span>&nbsp;Delete
													</button>
												</div>
											</div>
										</div>
									</div>
									</c:forEach>--%>
									</div>
									
										<div class="form-group  has-feedback ${requestScope['org.springframework.validation.BindingResult.propertyBean'].hasFieldErrors('address')?'has-error':'' }">
										<div class="panel panel-default">
											<div class="panel-heading"><h5>Optional</h5></div>
												<div class="panel-body">										
													<label class="col-sm-2 control-label" for="commisionFee">Commision Fee</label>
													<div class="col-sm-10">						
														<form:input type="text"  path="commisionFee" class="form-control" id="commisionFee"  	data-toggle="tooltip" data-placement="top" title="Commision Fee is optional, our agents will help you to sell/lease your property based on your commision fee! If you don't need help, you can put 0 or 0%. If you do need help, please input a constant number or a percentage!"  placeholder="commision fee(optional)" />											
													</div>
												</div>
										</div>
									</div>

									<form:input type="hidden" path="lat" id="lat" /> 
									<form:input type="hidden" path="lng" id="lng" />
									<button type="submit" id="propertyButton"
										class="btn btn-primary btn-block">Submit</button>
							
						</div>
					</div>
					</form:form>
				</div>
					<div class="col-md-6">
						<div id="map">							
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
<!-- 	<script src="https://maps.googleapis.com/maps/api/js?v=3&libraries=places" async defer></script> -->
	 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	<%-- <script src="${path}/js/markerwithlabel.js"></script> --%>
	<!-- <script src="http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerwithlabel/1.1.9/src/markerwithlabel.js"></script> -->
	<script src="${path}/js/markerwithlabel.js"></script>
	<script src="${path}/js/property.js"></script>
	
	<script>
	
</script>
	
	
</body>

</html>