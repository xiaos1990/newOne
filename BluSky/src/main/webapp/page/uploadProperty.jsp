<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c"%>


<!DOCTYPE html>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="../js/jquery-1.12.2.js"></script>
<script src="https://maps.googleapis.com/maps/api/js" async defer></script>
<style>
.error {
color:red;
}

</style>
</head>
<body onload="initialize();">

Property Information:

	<form:form action="/BluSky/property/upload" method="post"
		commandName="propertyBean"  enctype="multipart/form-data">
		<div>
		<form:errors path="*" cssClass="error"/></div>
		<div>
		address:
			<form:input path="address" cssId="address"/>
		</div>
		<div>
			city:
			<form:input path="city" cssId="city"/>
		</div>
		
		<div>
		state:
			<form:select path="state" cssId="state">
								<form:option value="">--please select--</form:option>
								<c:forEach var="opts" items="${USstates}">
									<form:option value="${opts['value'] }">${opts['label'] }</form:option>
								</c:forEach>
							</form:select>
		</div>
		<div>
		zipCode:
			<form:input path="zipCode"  cssId="zipcode"/>
		</div>
		<div>
		Country:
			<form:input path="Country"  cssId="Country"/>
		</div>
		<div>
		type:
			<form:select path="type" >
			<c:forEach var="ptype1" items="${propertyTypes }">
				<form:option  value="${ptype1.REF_VALUE }" >${ptype1.SHORT_DESCRIPTION }</form:option>
			</c:forEach>
			</form:select>
		</div>
		<div>
		propertyType:
			<form:select path="propertyType" >
			<c:forEach var="type1" items="${types }">
				<form:option  value="${type1['REF_VALUE'] }" >${type1['SHORT_DESCRIPTION'] }</form:option>
			</c:forEach>
			</form:select>
		</div>
		<div>
		baths:
			<form:input path="baths" />
		</div>
		<div>
		beds:
			<form:input path="beds" />
		</div>
		<div>
		size:
			<form:input path="size" />
		</div>
			<div>
		price:
			<form:input path="price" />
		</div>
		<div>Lease Details:</div>
		<c:forEach var="detail" items="${leaseList }">
			<div>
				<input type="checkbox" name="leaseDetails"
					value="${detail.SHORT_DESCRIPTION }" 
					<c:forEach var="lease" items="${leaseDetails }">
						<c:if test="${detail.SHORT_DESCRIPTION eq lease }">
						checked
						</c:if>
					</c:forEach>
					>${detail.SHORT_DESCRIPTION }
			</div>
		</c:forEach>
		<div> Amenities:</div>
		<c:forEach var="amenity" items="${amenityList }">
			<div>
				<input type="checkbox" name="amenities"
					value="${amenity.REF_VALUE }" 
					<c:forEach var="amenityResult" items="${amenities }">
						<c:if test="${amenity.REF_VALUE eq amenityResult }">
						checked
						</c:if>
					</c:forEach>
					 >${amenity.SHORT_DESCRIPTION }
			</div>
		</c:forEach>
		
		<div id="files">
		images/videos:
			<input type="file" name="btnFile" />
			<input type="hidden" name="lat" id="lat" />
					<input type="hidden" name="lng" id="lng"/>
		</div>
		<button onclick="return addMore();">ADD MORE</button>
		<input type="button" value="submit" onclick="codeAddress();"/>
	</form:form>

</body>
<script>
	function addMore() {
		$("#files").append('<input type="file" name="btnFile"/> ');
		return false;
	};
	
	var geocoder;

	function initialize() {
		geocoder = new google.maps.Geocoder();
	};


function codeAddress() {
		var address = $("#address").val();
		var city= $("#city").val();
		var state= $("#state").val();
		var zipcode= $("#zipcode").val();
		var country= $("#country").val();
		var fullAddress='';
		if((address=$.trim(address))!='')
		fullAddress=fullAddress+address+',';
		if((city=$.trim(city))!='')
		fullAddress=fullAddress+city+',';
		if((state=$.trim(state))!='')
		fullAddress=fullAddress+state+',';
		if((zipcode=$.trim(zipcode))!='')
		fullAddress=fullAddress+zipcode;
		console.log(fullAddress);
		 geocoder.geocode( { 'address': fullAddress}, function(results, status) {
				var lat=results[0].geometry.location.lat();
				var lng=results[0].geometry.location.lng();
				$("#lat").val(lat);
				$("#lng").val(lng);
				if (status == google.maps.GeocoderStatus.OK) {			
				document.forms[0].submit();		
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
	};


/* $(function(){
$.getJSON('../resources/US_STATES.json',function(data){
var state=$("#state");
 state.append('<option value=""></option>');
 $.each( data, function( key, val ) {
   state.append('<option value="'+val+'">'+key+'</option>');
  });
}); */

/* $("input:button").on("click",function(){
codeAddress();
});
}); */
	
	
	
</script>
</html>