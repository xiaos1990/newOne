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
</style>
</head>
<body onload="initialize();">


	<div>

		<div style="float: left; width: 50%; height:800px; overflow-y: scroll">
			<div class="formDiv">

				<label for="address">Address:</label> <input type="text"
					name="address" id="address" placeholder="input an address"
					onchange="codeAddress();" /> <label for="propertyType">Property
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
			<c:forEach var="properties" items="${list }" varStatus="status">
				<a href="/BluSky/property/displayDetails/${properties.id}"
					target="body"> <!-- <div class="main"> --> <img
					src="${properties['address1']}" />
					<div class="innerTextDiv">
						<div style="float: left, text-align:left">
							<b>Address</b><br />${properties['address']}</div>
						<div style="float: left, text-align:left">
							<b>city</b><br />${properties['city']}</div>
						<div style="float: left, text-align:left">
							<b>state</b><br />${properties['state']}</div>
						<div style="float: left, text-align:left">
							<b>zipCode</b><br />${properties['zipCode']}</div>
						<div
							style="float: left, text-align:left; word-break: break-all; word-wrap: break-word;">
							<b>features</b><br />${properties['description']}</div>
					</div> <!-- </div> -->
				</a>
			</c:forEach>

		</div>
		<div id="googleMap">
			<div id="map"></div>
		</div>

	</div>

</body>
<script>
	var geocoder;
	var map;
	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(-34.397, 150.644);
		var mapOptions = {
			zoom : 10,
			center : latlng
		}
		map = new google.maps.Map(document.getElementById("map"), mapOptions);
	}

	function codeAddress() {
		var address = document.getElementById("address").value;
		geocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				return results[0].address_components[6].long_name;
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
	};

 	$(function() {
 	
	 	var jsonObject = "${jsonObject}";
		console.log(jsonObject);
		fillAddress(jsonObject);
 
	});

	function fillAddress(jsonAddress) {
		/*   var jsonAddress ={
		"address":[{"location":"lansing"},
		{"location":"michigan state university"}
		]
		}; */
		var address;
		for (var i = 0; i < jsonAddress.PropertyBean.length; i++) {
			address = jsonAddress.PropertyBean[i].address;
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status == google.maps.GeocoderStatus.OK) {
									map.setCenter(results[0].geometry.location);
									var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
									var marker = new google.maps.Marker(
											{
												map : map,
												position : results[0].geometry.location,
												icon : iconBase
														+ 'schools_maps.png'
											});
								} else {
									alert("Geocode was not successful for the following reason: "
											+ status);
								}
							});
		}
		;
	};

	function ajaxCall() {
		var zipCode = codeAddress();
		alert(1);
		$.ajax({
			url : 'http://localhost:7001/BluSky/property/display1',
			type : 'POST',
			data : 'zipCode=' + zipCode,
			cache : false,
			success : function(data) {
				console.log(123);

				fillAddress(data);
				$("#body").reload();
			},
			error : function() {
				alert(arguments[1]);
			},
		});

	}

	/* function initsize(){
		

		
		if($(window).width()<500){
		$("body").css("margin","0");
			$(".main").width($(window).width());
			$(".innerTextDiv").width($(".main").width());
			$("img").height($(".main").width());
			$("img").width($(".main").width());
		}else{
		$("body").css("margin-left",$(window).width() *0.1);
		$("body").css("margin-right",$(window).width() *0.1);
		var size = $(window).width() * 0.25;
		var size1 = $(window).width() * 0.14;
		$("img").height(size);
		$("img").width(size);
		$(".innerTextDiv").width(size1);
		$(".main").width($(window).width()*0.395);
		
		}
	
		 if($(".main").height()>(size+5)){
			$(".innerTextDiv").width($(".main").width()-5);
			$("img").height($(".main").width()-5);
			$("img").width($(".main").width()-5);
		} 
		
	}
	$(function() {
		initsize();
	});

	 window.onresize = function() {
		initsize();
	};  */

	/* 	$(".main").on("mouseenter mouseleave",function(event){
	 console.log(123);
	 var self = $(this);
	 if(event.type=='mouseenter'){
	 self.css({"border": "dashed blue 0.5px"});
	 }else{
	 self.css('border','none');
	 }
	
	 }); */
</script>
</html>