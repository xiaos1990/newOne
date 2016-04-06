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
<body onload="initialize();loadJson();">


	<div>

		<div style="float: left; width: 50%; height:800px; overflow-y: scroll">
			<div class="formDiv">

				<label for="address">Address:</label> <input type="text"
					name="address" id="address" placeholder="input an address"
					onchange="codeAddress();ajaxCall();" /> <label for="propertyType">Property
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
			<c:forEach var="properties" items="${list123}" varStatus="status">
				<a href="/BluSky/property/displayDetails/${properties.id}"
					target="body"> <!-- <div class="main"> --> <img
					src="${properties.files[0].address}" />
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
		<div id="googleMap">
			<div id="map"></div>
		</div>

	</div>

</body>
<script>
 	var bounds;
 	var zipcode123;
	var geocoder;
	var map;
	var markers = [];
	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(-34.397, 150.644);
		var mapOptions = {
			zoom : 10,
			center : latlng
		}
		map = new google.maps.Map(document.getElementById("map"), mapOptions);
	};

	function codeAddress() {
		var address = document.getElementById("address").value;
		console.log(address);
		 geocoder.geocode( { 'address': address}, function(results, status) {
				console.log(results);
				var index1;
				if (status == google.maps.GeocoderStatus.OK) {
				map.setCenter(results[0].geometry.location);
				var marker = new google.maps.Marker({
					map : map,
					position : results[0].geometry.location
				});
				markers.push(marker);
				index1=parseFloat(results[0].address_components.length)-1;
				zipcode123= results[0].address_components[index1].long_name;
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
	};

/*  	$(function() {
 	
	 	var jsonObject = ${jsonObject};
		console.log(jsonObject); 
		fillAddress(jsonObject);
 
	}); */

	function fillAddress(jsonAddress) {
		/*   var jsonAddress ={
		"address":[{"location":"lansing"},
		{"location":"michigan state university"}
		]
		}; */
		var address;
		for (var i = 0; i < jsonAddress.length; i++) {
			address = jsonAddress[i].address+","+jsonAddress[i].zipCode;
			console.log(address);
		 geocoder.geocode( { 'address': address}, function(results, status) {
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
												markers.push(marker);
								} else {
									alert("Geocode was not successful for the following reason: "
											+ status);
								}
							});
		}
		;
	};

	function ajaxCall() {
		deleteMarkers();
		$.ajax({	
			url : 'http://localhost:7001/BluSky/property/display1',
			type : 'POST',
			data : 'zipcode='+zipcode123,
			cache : false,
			success : function(data) {
				fillAddress(data);	
			},
			error : function() {
				alert(arguments[1]);
			},
		});

	}
	
	function loadJson(){
	var jsonObject1 = ${jsonObject};
		//console.log(jsonObject); 
		fillAddress(jsonObject1);
	};


function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  };
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
};



google.maps.event.addListener(map,'center_changed',function() { checkBounds(); });

function checkBounds() {    
    if(! allowedBounds.contains(map.getCenter())) {
      var C = map.getCenter();
      var X = C.lng();
      var Y = C.lat();

      var AmaxX = allowedBounds.getNorthEast().lng();
      var AmaxY = allowedBounds.getNorthEast().lat();
      var AminX = allowedBounds.getSouthWest().lng();
      var AminY = allowedBounds.getSouthWest().lat();

      if (X < AminX) {X = AminX;}
      if (X > AmaxX) {X = AmaxX;}
      if (Y < AminY) {Y = AminY;}
      if (Y > AmaxY) {Y = AmaxY;}

      map.setCenter(new google.maps.LatLng(Y,X));
    }
}

function getBoundaries(){
var bounds = map.getBounds();
var ne = bounds.getNorthEast(); // LatLng of the north-east corner
var sw = bounds.getSouthWest(); // LatLng of the south-west corder
console.log(bounds);

var nw = new google.maps.LatLng(ne.lat(), sw.lng());
var se = new google.maps.LatLng(sw.lat(), ne.lng());


google.maps.event.addListener(map, 'idle', function(ev){
    // update the coordinates here
});
}



 function initialize() {
         bounds = new google.maps.LatLngBounds();
        var latLng = new google.maps.LatLng(33.76, -84.39);
        var myMapOptions = {
            sensor: true,
            mapTypeControl: true,
            zoom: 14,
            center: new google.maps.LatLng(33.76, -84.39),
            rotateControlOptions: false,
            panControl: false,
            scrollwheel: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var infowindow = new google.maps.InfoWindow({
            disableAutoPan : false,
        });
        var map = new google.maps.Map(document.getElementById('map_newsfeed'), myMapOptions);
        google.maps.addListenerOnce(map, 'bounds_changed', function() {
            var bounds = map.getBounds();
            var ne = bounds.getNorthEast();
            var sw = bounds.getSouthWest();

            $.ajax({
                url: '/api/v1/building_permits/geo_bbox/'+ne.e+','+ne.d+'/'+sw.e+','+sw.d,
                success: function (json) {
                    // now make an empty bounds to determine the new viewport
                    var bounds =  new google.maps.LatLngBounds();
                    for (var i = 0; i < json.length; ++i) {
                        var latLng = new google.maps.LatLng(json[i].latitude, json[i].longitude);
                        bounds.extend(latLng);
                        var marker = new google.maps.Marker({position: latLng});
                        attachInfoWindows(marker, map, infowindow, json[i].latitude, json[i].longitude)
                    }
                    // only fit the bounds when all the markers have been added.
                    map.fitBounds(bounds);
                }
            });
        });
    };

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