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
<style>
.error {
color:red;
}

</style>
</head>
<body>

Property Information:

	<form:form action="/BluSky/property/upload" method="post"
		commandName="propertyBean" enctype="multipart/form-data">
		<div>
		<form:errors path="*" cssClass="error"/></div>
		<div>
		address:
			<form:input path="address" />
		</div>
		<div>
			city:
			<form:input path="city" />
		</div>
		
		<div>
		state:
			<form:select path="state" >
								<form:option value="">--please select--</form:option>
								<c:forEach var="opts" items="${USstates}">
									<form:option value="${opts['value'] }">${opts['label'] }</form:option>
								</c:forEach>
							</form:select>
		</div>
		<div>
		zipCode:
			<form:input path="zipCode" />
		</div>
		<div>
		Country:
			<form:input path="Country" />
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
		</div>
		<button onclick="return addMore();">ADD MORE</button>
		<input type="submit" value="submit" />
	</form:form>

</body>
<script>
	function addMore() {
		$("#files").append('<input type="file" name="btnFile"/> ');
		return false;
	}
</script>
</html>