<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>signUp</title>
<script src="../js/jquery-1.12.2.js"></script>
<script src="https://maps.googleapis.com/maps/api/js" async defer></script>
<script src="../js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<style>
.error {
	color: red;
}
</style>
</head>
<body onload="initialize();">
	<div id="dialog-form">
		<form:form action="/BluSky/user/signup" method="post"
			commandName="UserBean"  >
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
		</form:form>
	</div>

</body>
<script>
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
		var fullAddress="";
		if((address=$.trim(address))!='')
		fullAddress=fullAddress.toString()+address+',';
		if((city=$.trim(city))!='')
		fullAddress=fullAddress.toString()+city+',';
		if((state=$.trim(state))!='')
		fullAddress=fullAddress.toString()+state+',';
		if((zipcode=$.trim(zipcode))!='')
		fullAddress=fullAddress.toString()+zipcode;
		console.log(fullAddress.toString());
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
});

$("input:button").on("click",function(){
codeAddress();
});
}); */
	
</script>
</html>