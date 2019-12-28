<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VBCMR | OTP VERIFICATION</title>

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
	<div class="form-title"></div>
	<div class="login-form text-center">
		<div>
			<img
				src="${pageContext.request.contextPath }/static/img/vidybhavan/VBCMR LOGO.png"
				class="brand_logo" alt="Logo"
				style="height: 50%; width: 100%; margin-bottom: 0px;"> <input
				id="mobileOtp" value="${mobileOtp }" type="hidden" /> <input
				id="emailOtp" value="${emailOtp }" type="hidden" />
			<div id="data" style="display: none;">${data}</div>
		</div>

		<div class="form formLogin" style="margin-top: -40px;">

			<form method="post" id="otpVerifyForm">
				<input type="text" id="verifyEmailOtp" name="verifyEmailOtp"
					placeholder="Enter Email OTP" /> <input type="text"
					id="verifyMobileOtp" name="verifyMobileOtp"
					placeholder="Enter Mobile OTP" /> <input id="finalJson"
					name="finalJson" type="hidden">
				<button id="grad" type="submit" onclick="submitOtp();"
					style="background-color: green;">VERIFY</button>
				<button type="submit" id="resend" onclick="resendOtp();"
					style="margin-top: 10px; background-color: white; color: red; font-weight: bold; text-align: right; margin-right: -15px;">RESEND
					OTP</button>
			</form>
		</div>

	</div>

</body>

<!-- start js include path -->
<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/static/js/pages/extra_pages/pages.js"></script>
<!-- end js include path -->
<%-- <script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script> --%>

<script type="text/javascript">
	function submitOtp() {
		var emailOtp = $("#emailOtp").val();
		var mobileOtp = $("#mobileOtp").val();
		var data = $("#data").html();

		var object = {
			"emailOtp" : emailOtp,
			"mobileOtp" : mobileOtp,
			"data" : data
		};
		$("#finalJson").val(JSON.stringify(object));
		var form = document.getElementById("otpVerifyForm");
		form.setAttribute("action",
				"${pageContext.request.contextPath}/register/verify/otp");
		form.submit();
	}

	function resendOtp() {
		var data = $("#data").html();

		$("#finalJson").val(data);
		var form = document.getElementById("otpVerifyForm");
		form.setAttribute("action",
				"${pageContext.request.contextPath}/register/resend/otp");
		form.submit();
	}
</script>


</html>




























