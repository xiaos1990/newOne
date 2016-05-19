<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c"%>
<%@taglib uri="/fn.tld" prefix="fn"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
 <link href="http://vjs.zencdn.net/5.9.2/video-js.css" rel="stylesheet">
<script src="/BluSky/js/jquery-1.12.2.js"></script>
<script src="https://maps.googleapis.com/maps/api/js" async defer></script>
<style>
#googleMap {
        width: 500px;
        height: 400px;
      }

</style>
<!-- <script>
var map;
var json =${users};
var lat =${propertyBean.lat};
var lng=${propertyBean.lng};
var lat1=${lat};
var lng1=${lng};
var markers=[];
var infowindow;
	function initialize() {
		var mapOptions = {
			zoom : 12,
			mapTypeControl: true,
			center : new google.maps.LatLng(lat, lng),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
		map = new google.maps.Map(document.getElementById('googleMap'),mapOptions);
		  infowindow = new google.maps.InfoWindow({
            disableAutoPan : false,
        });
		 var marker = new google.maps.Marker({
					map : map,
					position : new google.maps.LatLng(lat, lng)
				});
		 var marker = new google.maps.Marker({
					map : map,
					position : new google.maps.LatLng(lat1, lng1)
				});
	/* 	  var route = [
          new google.maps.LatLng(lat, lng),
          new google.maps.LatLng(lat1, lng1)];


    var polyline = new google.maps.Polyline({
        path: route,
        strokeColor: "#ff0000",
        strokeOpacity: 0.6,
        strokeWeight: 5
    });

    polyline.setMap(map); */
	var directionsDisplay = new google.maps.DirectionsRenderer();
	directionsDisplay.setMap(map);
	var directionsService =new google.maps.DirectionsService();
	var request = {
      origin: new google.maps.LatLng(lat1, lng1),
      destination: new google.maps.LatLng(lat, lng),
      travelMode: google.maps.TravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
      if (status == google.maps.DirectionsStatus.OK) {
        directionsDisplay.setDirections(response);
        directionsDisplay.setMap(map);
        var point = response.routes[ 0 ].legs[ 0 ];
        $( '#travelTime' ).html( 'Estimated travel time: ' + point.duration.text + ' (' + point.distance.text + ')' );
      } else {
        alert("Directions Request from " + start.toUrlValue(6) + " to " + end.toUrlValue(6) + " failed: " + status);
      }
    });
    
  /*    var point = response.routes[ 0 ].legs[ 0 ];
        $( '#travelTime' ).html( 'Estimated travel time: ' + point.duration.text + ' (' + point.distance.text + ')' );
    } */
				
		for (var j = 0; j < json.length; j++) {
			var latLng = new google.maps.LatLng(json[j].lat, json[j].lng);
			// bounds.extend(latLng);                   
			var marker = new google.maps.Marker({
				map : map,
				position : latLng,
				icon : '../../image/Person.png'
			});
			attachInfoWindows(marker, map, infowindow, json[j]);
			markers.push(marker);
		};
		
	};
	//google.maps.event.addDomListener(window, 'load', initialize);
	
	

/* 	$(function() {
		for (var j = 0; j < json.length; j++) {
			var latLng = new google.maps.LatLng(json[i].lat, json[i].lng);
			// bounds.extend(latLng);                   
			var marker = new google.maps.Marker({
				map : map,
				position : latLng,
				icon : '../image/Person.png'
			});
			//attachInfoWindows(marker, map, infowindow, json.users[i]);
			markers.push(marker);
		};

	}); */
	
	  function attachInfoWindows(marker, map, infowindow,jsonObj) {
            google.maps.event.addListener(marker, 'click', function() {
                        
                        infowindow.setContent(
'<div>'+jsonObj.address+' </div>'+
'<div>'+jsonObj.city+' </div>'+
'<div>'+jsonObj.zipCode+' </div>'+
'<div>'+jsonObj.state+' </div>'+
'<div>'+jsonObj.country+' </div>'
);
                        infowindow.open(map, marker);               
            });
        };
</script> -->
</head>



<head>
 

  <!-- If you'd like to support IE8 -->
  <script src="http://vjs.zencdn.net/ie8/1.1.2/videojs-ie8.min.js"></script>
</head>
<body onload=" initialize()">
	<div>

		<c:forEach var="file" items="${propertyBean.files }">
			<c:choose>

				<c:when test="${fn:contains(file.address,'.mp4') }">
					
					 <video id="my-video" class="video-js" controls preload="auto" width="640" height="264"
 					 	poster="/BluSky/image/cute.jpg" data-setup="{}">
    					<source src="${file.address }" type='video/mp4'>
    					<!-- <source src="MY_VIDEO.webm" type='video/webm'> -->
				   	 	<p class="vjs-no-js">
				     	 To view this video please enable JavaScript, and consider upgrading to a web browser that
				      	<a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
    					</p>
  					</video>
  					
  					 <video id="my-video" class="video-js" autoplay width="640" height="264"
 					 	poster="/BluSky/image/cute.jpg" data-setup="{}">
    					<source src="${file.address }" type='video/mp4'>				   	 	
  					</video>
					
				</c:when>
				<c:otherwise>
					<div>
						<img src="${file.address }" />
					</div>
				</c:otherwise>
			</c:choose>

		</c:forEach>
	</div>
	<div id="travelTime" style="color:red"></div>
	<div id="googleMap"></div>

  <script src="http://vjs.zencdn.net/5.9.2/video.js"></script>
</body>
</html>