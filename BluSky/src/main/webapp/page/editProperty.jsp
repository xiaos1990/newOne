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
<link rel="shortcut icon" href="${path}/image/bitbug_favicon.ico" /> 
<link rel="stylesheet" href="${path}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${path}/css/editProperty.css" />
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
				<a href="${path }/" class="navbar-brand"><span class="glyphicon glyphicon-home"> </span><span class="hidden-sm hidden-xs homeLabel">&nbsp;cat&dog</span></a>
			</div>
			<div class="navbar-collapse collapse" id="mainMenu">
				<form class="navbar-form navbar-left" role="search">
					<div class="input-group">
						<input type="text" class="form-control" id="searchAddress" placeholder="Search">
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

<section id="form1" >	
		<div class="container">
			<div class="row">		
				<div class="col-md-12">	
				<form:form action="${path }/property/upload" method="post" id="propertyForm" commandName="propertyBean" class="form-horizontal" enctype="multipart/form-data">	
					<div class="panel panel-default">
						<div class="panel-heading"><h4>Property Information:</h4></div>
						<div class="panel-body">
									<div class="form-group  has-feedback ">
										<label class="col-sm-2 control-label" for="address">Address</label>
										<div class="col-sm-10 control-label1">
											${propertyBean.address },${propertyBean.city },${propertyBean.state },${propertyBean.zipCode }
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
								</div>
									<div class="panel-footing">
									<button type="submit" id="propertyButton"
										class="btn btn-primary btn-block">Submit</button>	
									</div>
								</div>	
							</form:form>
							<form action="${path }/property/update" method="post" >
									<div class="panel panel-default">
										<div class="panel-heading"><h5>IMG/VIDEO</h5></div>
										<div class="panel-body">
											<c:forEach var="file" items="${propertyBean.files }" varStatus="status">																						
												<div class="col-sm-4" style="margin-bottom:5px">						
													<div id="div${status.index }" ondrop="drop(event)" ondragover="allowDrop(event)">
														<a id="a${status.index }" href="#">
														<img id="drag${status.index }" src="${file.address }" draggable="true" ondragstart="drag(event)" width="100%" height="100%">
														<span class="badge">${status.index+1 }</span>
														</a>
														<input type="hidden" id="hide${status.index }" name="position_${status.index }" value="${file.file_id }" />
													</div>
												</div>
											</c:forEach>	
										</div>
										<div class="panel-footing">
										<!-- 	<button class="btn btn-primary btn-block" >preview</button> -->											
											<a href="#" id="previewBtn" class="btn btn-primary btn-block" data-toggle="modal" data-target="#preview">preview</a>
											<button type="submit" id="propertyButton"
											class="btn btn-primary btn-block">Update</button>	
										</div>
									</div>
						<!-- </div> -->




									<%-- <form:input type="hidden" path="lat" id="lat" /> 
									<form:input type="hidden" path="lng" id="lng" /> --%>
															
						</div>
					<!-- </div> -->
					</form>
				</div>				
			</div>
		</div>
</section>		

<div class="modal fade" id="preview" tabindex="-1" >
	<div id="filter">
  <div class="modal-dialog modal-lg">
  	
    <div class="modal-content">
    	
    	     	
    	<div class="modal-header">
        <button type="button"  class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     	</div>
     

			<div id="flip1" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner" role="listbox" ">						
					
					
				<%-- 
					<c:forEach var="file" items="${propertyBean.files}" varStatus="status">
						<div class="item  <c:if test="${status.index =='0' }">active</c:if>"  style="height:600px;width:100%" >
							<img src="${file.address}" height="100%" width="100%" alt="MIAMI">									
						</div>										
					</c:forEach> --%>
					
					<a id="mark" class="left carousel-control" href="#flip1" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> 
					<a class="right carousel-control" href="#flip1" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>	
			
					
	 	
    
    </div>
  </div>
  </div>
</div>


	
	<section id="foot">
		<div class="container-fluid">
			<div class="row">
				<h1>TO BE CONTINUE!</h1>
			</div>
		</div>
	</section>
<script src="${path}/js/jquery-1.12.2.js"></script>
	<script src="${path}/js/bootstrap.min.js"></script>
<%-- <!-- 	<script src="https://maps.googleapis.com/maps/api/js?v=3&libraries=places" async defer></script> -->
	 <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	<script src="${path}/js/markerwithlabel.js"></script>
	<script src="http://google-maps-utility-library-v3.googlecode.com/svn/tags/markerwithlabel/1.1.9/src/markerwithlabel.js"></script> --%>
	<script src="${path}/js/editProperty.js"></script>
	<script>

		var id1;
		var id2;
		var id3;
		var value;

		function allowDrop(ev) {
			ev.preventDefault();
		}

		function drag(ev) {
			//ev.dataTransfer.setData("text", ev.target.id);
			id1 = $(ev.target).parent().prop("id"); //get a tag
			id2 = ev.target.id; //get img
			id3 = $(ev.target).parent().siblings("input:first").prop("id"); //get input
			value = $(ev.target).parent().siblings("input:first").val(); //get input value
			console.log(ev.target);
		}

		function drop(ev) {
			ev.preventDefault();

			var data = ev.target;
			console.log(ev.target);
			if (data.tagName == 'IMG') {
				$("#" + id3).val(
						$(ev.target).parent().siblings("input:first").val());
				$(ev.target.parentNode).prepend($("#" + id2));
				$(ev.target.parentNode).siblings("input:first").val(value);
				$("#" + id1).prepend(ev.target);
			}
		}

		$(function() {
			$("#previewBtn").on(
					"click",
					function() {
						var div;
						$(".item").remove();
						$("a[id^=a]").each(
								function(i) {
									if (i == 0) {
										$('<div/>', {
											class : 'item active'
										}).append(
												$('<img src='
														+ $(this).children(
																"img:first")
																.prop("src")
														+ '  />'))
												.insertBefore($("#mark"));
									} else {
										$('<div/>', {
											class : 'item'
										}).append(
												$('<img src='
														+ $(this).children(
																"img:first")
																.prop("src")
														+ '  />'))
												.insertBefore($("#mark"));
									}
								});
					});
		});
	</script>
</body>

</html>