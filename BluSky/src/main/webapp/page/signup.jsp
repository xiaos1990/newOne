<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/spring-form.tld" prefix="form"%>
<%@taglib uri="/c.tld" prefix="c"%>
<%@page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>signUp</title>
<script src="../js/jquery-1.12.2.js"></script>
<!-- <script src="../js/bootstrap.min.js"></script> -->
<script src="../js/jquery-ui.min.js"></script>
<!-- <link rel="stylesheet" href="../css/bootstrap.min.css"> -->
<link rel="stylesheet" href="../css/jquery-ui.min.css">
<style>
.error {
	color: red;
}
</style>
</head>
<body>
	<div id="dialog-form">
		<form:form action="/BluSky/user/signup" method="post"
			commandName="UserBean" target="body">
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
						<td><label for="phone">address:</label></td>
						<td><form:input path="address" id="address"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="address" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="phone">city:</label></td>
						<td><form:input path="city" id="city"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="city" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="phone">zipCode</label></td>
						<td><form:input path="zipCode" id="zipCode"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="zipCode" cssClass="error" /></td>

					</tr>
					<tr>
						<td><label for="phone">state:</label></td>
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
						<td><label for="phone">country:</label></td>
						<td><form:input path="country" id="country"
								class="text ui-widget-content ui-corner-all" /></td>
						<td><form:errors path="country" cssClass="error" /></td>

					</tr>
					<tr>
						<!-- Allow form submission with keyboard without duplicating the dialog button -->
						<td colspan="2"><input type="submit" class="btn"
							value="submit"></td>

					</tr>
				</table>
			</fieldset>
		</form:form>
	</div>

</body>
<script>
	
</script>
</html>