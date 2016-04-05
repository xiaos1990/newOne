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
<script type="text/javascript" src="../js/jquery-1.12.2.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<style>
#googleMap {
        width: 500px;
        height: 400px;
      }

</style>
<script>
var map;
	function initialize() {
		var mapOptions = {
			zoom : 8,
			center : new google.maps.LatLng(-34.397, 150.644)
		};
		map = new google.maps.Map(document.getElementById('googleMap'),mapOptions);
	};
	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div>

		<c:forEach var="file" items="${propertyBean.files }">
			<c:choose>

				<c:when test="${fn:contains(file.address,'.mp4') }">
					<video controls="controls" height="250px" width="600px"
						preload="auto">
						<source src="${file.address }" type=video/mp4 />
						Brower doesn't support
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

	<div id="googleMap"></div>

</body>
</html>