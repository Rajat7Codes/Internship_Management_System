<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VBCMR | Login</title>

<link
	href="../../../../../fonts.googleapis.com/css6079.css?family=Poppins:300,400,500,600,700"
	rel="stylesheet" type="text/css" />
<!-- icons -->
<link
	href="${pageContext.request.contextPath }/static/fonts/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/static/fonts/material-design-icons/material-icon.css"
	rel="stylesheet" type="text/css" />
<!-- bootstrap -->
<link
	href="${pageContext.request.contextPath }/static/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/static/css/pages/extra_pages.css">
<!-- favicon -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/static/img/favicon.png" />
<style>
input:focus {
	outline: solid 1px green !important;
}
</style>
</head>
<body>
	<c:url var="loginUrl" value="/login" />
	<div class="form-title"></div>
	<!-- Login Form-->
	<div class="login-form text-center">
		<div>
			<!-- <i class="fa fa-user-plus"></i> -->
			<img
				src="${pageContext.request.contextPath }/static/img/vidybhavan/VBCMR LOGO.png"
				class="brand_logo" alt="Logo"
				style="height: 50%; width: 100%; margin-bottom: -40px;">
		</div>
		<div class="form formLogin">

			<c:if test="${param.error != null}">
				<div class="alert alert-danger">Username Or Password is
					Incorrect</div>
			</c:if>
			<c:if test="${param.logout != null}">
				<div class="alert alert-success">Logged Out Succesfully.... !</div>
			</c:if>

			<form action="${loginUrl}" method="post">
				<input type="text" id="username" name="ssoId"
					placeholder="Enter Username" required="required" /> <input
					type="password" id="password" name="password"
					placeholder="Enter Password" required="required" />
				<div class="remember text-left">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="defaultUnchecked"> <label
							class="custom-control-label pb-3" for="defaultUnchecked">Remember
							Me</label>
					</div>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
				<button>Login</button>
			</form>
		</div>

	</div>
	<!-- start js include path -->
	<script
		src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/static/js/pages/extra_pages/pages.js"></script>
	<!-- end js include path -->
</body>
</html>