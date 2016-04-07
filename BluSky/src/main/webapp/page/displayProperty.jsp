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
<script src="https://maps.googleapis.com/maps/api/js?libraries=places" async defer></script>
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

	</div>

</body>
<script>
var lat =${lat};
var lng=${lng};
 	var bounds;
 	var zipcode123;
	var geocoder;
	var map;
	var markers = [];
	var markersCenter = [];
	var infowindow;
		 var ne;
          var sw ;
/* 	function initialize() {
		geocoder = new google.maps.Geocoder();
		var latlng = new google.maps.LatLng(-34.397, 150.644);
		var mapOptions = {
			zoom : 10,
			center : latlng
		}
		map = new google.maps.Map(document.getElementById("map"), mapOptions);
	};
 */
 
 function initialize() {
         geocoder = new google.maps.Geocoder();
        var latLng = new google.maps.LatLng(lat, lng);
        var myMapOptions = {
            sensor: true,
            //mapTypeControl: true,
            zoom: 10,
            center: new google.maps.LatLng(25, -84),
            rotateControlOptions: false,
            panControl: false,
            scrollwheel: false,
           // mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        
            infowindow = new google.maps.InfoWindow({
            disableAutoPan : false,
        });
         map = new google.maps.Map(document.getElementById('map'), myMapOptions);
			map.setCenter(new google.maps.LatLng(lat,lng));
        var marker = new google.maps.Marker({
					map : map,
					position : latLng
				});
				
			
				
				markersCenter.push(marker);	
				
				
				
	var input = document.getElementById('address');
	  //map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  var searchBox = new google.maps.places.SearchBox((input));


  // Bias the SearchBox results towards current map's viewport.
  map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });
  
  
   searchBox.addListener('places_changed', function() {
  codeAddress();
  ajaxCall1();
  });
 /* 
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  }); */

/* 	 google.maps.event.addListener(map, 'center_changed', function() {
        
            var bounds = map.getBounds();
             ne = bounds.getNorthEast();
             sw = bounds.getSouthWest();
				ajaxCall1();
				}); */
				
        //google.maps.event.addListener(map, 'bounds_changed', function() {
        google.maps.event.addListener(map, 'idle', function() {
        
            var bounds = map.getBounds();
             ne = bounds.getNorthEast();
             sw = bounds.getSouthWest();
			ajaxCall1();
				
           /*  $.ajax({
                url: '/BluSky/property/display4/'+ne.lat()+','+ne.lng()+'/'+sw.lat()+','+sw.lng(),
                success: function (json) {
                    // now make an empty bounds to determine the new viewport
                     bounds =  new google.maps.LatLngBounds();
                    for (var i = 0; i < json.length; ++i) {
                        var latLng = new google.maps.LatLng(json[i].latitude, json[i].longitude);
                        bounds.extend(latLng);
                        var marker = new google.maps.Marker({position: latLng});
                        attachInfoWindows(marker, map, infowindow, json[i].latitude, json[i].longitude);
                    };
                    // only fit the bounds when all the markers have been added.
                    //map.fitBounds(bounds);
                }
            }); */
        });
    };
 
 
  function attachInfoWindows(marker, map, infowindow,jsonObj) {
            google.maps.event.addListener(marker, 'click', function() {
                        
                        infowindow.setContent(
'<div><a href="/BluSky/property/displayDetails/'+jsonObj.id+'"> <img src="'+jsonObj.files[0].address+'" width=50px height=50px  /> </div></a>'+
'<div>'+jsonObj.address+' </div>'+
'<div>'+jsonObj.city+' </div>'+
'<div>'+jsonObj.zipCode+' </div>'+
'<div>'+jsonObj.state+' </div>'+
'<div>'+jsonObj.country+' </div>'
);
                        infowindow.open(map, marker);               
            });
        }
       // google.maps.event.addDomListener(window, 'load', initialize);

 
 
 
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
				deleteCenterMarkers();
					markersCenter.push(marker);
				//markers.push(marker);
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
		//deleteMarkers();
		$.ajax({	
			url : 'http://localhost:7001/BluSky/property/display4/'+ne.lat()+'/'+ne.lng()+'/'+sw.lat()+'/'+sw.lng(),
			type : 'POST',
			cache : false,
			success : function(data) {
				fillAddress(data);	
			},
			error : function() {
				alert(arguments[1]);
			},
		});

	};
	
	
	
	function ajaxCall1() {
			deleteMarkers();
			$("#content").html("");
			//lat=map.getCenter().lat();
			//lng=map.getCenter().lng();
            $.ajax({
                url: '/BluSky/property/display4/'+ne.lat()+'/'+ne.lng()+'/'+sw.lat()+'/'+sw.lng()+"/",
                success: function (json) {
               // window.history.pushState("", "search screen", "http://localhost:7001/BluSky/property/display3?lat="+lat+"&lng="+lng);
                    // now make an empty bounds to determine the new viewport
                    //bounds = map.getBounds();
                    //var bounds = new google.maps.LatLngBounds();
                    for (var i = 0; i < json.properties.length; i++) {
                        var latLng = new google.maps.LatLng(json.properties[i].lat, json.properties[i].lng);
                       // bounds.extend(latLng);
                       var iconBase = 'https://maps.google.com/mapfiles/kml/shapes/';
                        var marker = new google.maps.Marker({map : map,position: latLng,icon : iconBase+'schools_maps.png'});
                        attachInfoWindows(marker, map, infowindow, json.properties[i]);
                        markers.push(marker);
                        var content = $("#content");
                        content.append('<a href="/BluSky/property/displayDetails/'+json.properties[i].id+'?lat='+lat+'&lng='+lng+'" onclick="changeCenter('+json.properties[i].lat+","+json.properties[i].lng+',this);" ><img id="'+i+'" src="'+json.properties[i].files[0].address+'" width=400px height=400px onmouseover="changeColor(this);"  onmouseout="changebackColor(this);"/> </a>');
                    };
                     for (var j = 0; j < json.users.length; j++) {
                        var latLng = new google.maps.LatLng(json.users[i].lat, json.users[i].lng);
                      // bounds.extend(latLng);                   
                        var marker = new google.maps.Marker({map : map,position: latLng,icon : '../image/Person.png'});
                        //attachInfoWindows(marker, map, infowindow, json.users[i]);
                        markers.push(marker);
                    };
                    // only fit the bounds when all the markers have been added.
                  // map.fitBounds(bounds);
                }
            });
	
	};
/* 	function loadJson(){
	var jsonObject1 = ${jsonObject};
		//console.log(jsonObject); 
		fillAddress(jsonObject1);
	}; */


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
function deleteCenterMarkers() {
  for (var i = 0; i < markersCenter.length; i++) {
    markersCenter[i].setMap(null);
  };
  markersCenter = [];
};



//google.maps.event.addListener(map,'center_changed',function() { checkBounds(); });

/* function checkBounds() {    
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
} */

/* function getBoundaries(){
var bounds = map.getBounds();
var ne = bounds.getNorthEast(); // LatLng of the north-east corner
var sw = bounds.getSouthWest(); // LatLng of the south-west corder
console.log(bounds);

var nw = new google.maps.LatLng(ne.lat(), sw.lng());
var se = new google.maps.LatLng(sw.lat(), ne.lng());


google.maps.event.addListener(map, 'idle', function(ev){
    // update the coordinates here
});
} */

function changeCenter(val1,val2,obj){
map.setCenter(new google.maps.LatLng(val1,val2));
bounds=map.getBounds();
  ne = bounds.getNorthEast();
  sw = bounds.getSouthWest();
  
  obj.href=obj.href+'&lat1='+ne.lat()+'&lng1='+ne.lng()+'&lat2='+sw.lat()+'&lng2='+sw.lng();
};


function changeColor(obj){
//console.log(obj.id);
markers[obj.id].setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png');
};

function changebackColor(obj){
markers[obj.id].setIcon('https://maps.google.com/mapfiles/kml/shapes/schools_maps.png');
};


</script>
</html>