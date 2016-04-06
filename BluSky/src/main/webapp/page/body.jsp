<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<title>BODY</title>
<script src="../js/jquery-1.12.2.js"></script>
<script src="https://maps.googleapis.com/maps/api/js" async defer></script>
</head>
<body onload="initialize();">
	<div><input type="text" placeholder="address" id ="address"/>
	<input type="text" placeholder="city" id="city"/>
	<select  id="state">
	
	</select>
	<input type="text" placeholder="zipcode" id="zipcode"/>
	<input type="text" placeholder="country" id="country"/>
	<input type="button" value="submit" />
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
		var fullAddres='';
		if((address=$.trim(address))!='')
		fullAddress=fullAddres+address+',';
		if((city=$.trim(city))!='')
		fullAddress=fullAddres+city+',';
		if((state=$.trim(state))!='')
		fullAddress=fullAddres+state+',';
		if((zipcode=$.trim(zipcode))!='')
		fullAddress=fullAddres+zipcode;
		console.log(fullAddress);
		 geocoder.geocode( { 'address': fullAddress}, function(results, status) {
				var lat=results[0].geometry.location.lat();
				var lng=results[0].geometry.location.lng();
				if (status == google.maps.GeocoderStatus.OK) {			
			window.location.href="/BluSky/property/display3?lat="+lat+"&lng="+lng;		
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
	};


$(function(){
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
});

</script>

</html>
