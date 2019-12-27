<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>My Awesome Login Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP"
	crossorigin="anonymous">


<style type="text/css">

/* Coded with love by Mutiullah Samim */
body, html {
	margin: 0;
	padding: 0;
	height: 100%;
	background: #60a3bc !important;
}

.user_card {
	height: 400px;
	width: 350px;
	margin-top: auto;
	margin-bottom: auto;
	background: #f39c12;
	position: relative;
	display: flex;
	justify-content: center;
	flex-direction: column;
	padding: 10px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-moz-box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	border-radius: 5px;
}

.brand_logo_container {
	position: absolute;
	height: 170px;
	width: 170px;
	top: -75px;
	border-radius: 50%;
	background: #60a3bc;
	padding: 10px;
	text-align: center;
}

.brand_logo {
	height: 150px;
	width: 150px;
	border-radius: 50%;
	border: 2px solid white;
}

.form_container {
	margin-top: 100px;
}

.login_btn {
	width: 100%;
	background: #c0392b !important;
	color: white !important;
}

.login_btn:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.login_container {
	padding: 0 2rem;
}

.input-group-text {
	background: #c0392b !important;
	color: white !important;
	border: 0 !important;
	border-radius: 0.25rem 0 0 0.25rem !important;
}

.input_user, .input_pass:focus {
	box-shadow: none !important;
	outline: 0px !important;
}

.custom-checkbox .custom-control-input:checked ~.custom-control-label::before
	{
	background-color: #c0392b !important;
}
</style>

</head>
<!--Coded with love by Mutiullah Samim-->
<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img
							src="https://cdn.freebiesupply.com/logos/large/2x/pinterest-circle-logo-png-transparent.png"
							class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form>
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="" class="form-control input_user"
								value="" placeholder="username">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="" class="form-control input_pass"
								value="" placeholder="password">
						</div>
						<div class="form-group">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="customControlInline"> <label
									class="custom-control-label" for="customControlInline">Remember
									me</label>
							</div>
						</div>
						<div class="d-flex justify-content-center mt-3 login_container">
							<button type="button" name="button" class="btn login_btn">Login</button>
						</div>
					</form>
				</div>

				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						Don't have an account? <a href="#" class="ml-2">Sign Up</a>
					</div>
					<div class="d-flex justify-content-center links">
						<a href="#">Forgot your password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>


<%-- <c:url var="loginUrl" value="/login" />
<div class="container-scroller">
	<div class="container-fluid page-body-wrapper full-page-wrapper">
		<div
			class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
			<div class="row flex-grow">
				<div
					class="col-lg-6 d-flex align-items-center justify-content-center">
					<div class="auth-form-transparent text-left p-3">
						<div class="brand-logo">
							<img
								src="${pageContext.request.contextPath }/assets/images/addgrow.png"
								alt="logo" style="height: 80px; width: 100%;">
						</div>
						<h4>Welcome back!</h4>
						<h6 class="font-weight-light">Happy to see you again!</h6>
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">Username Or Password is
								Incorrect</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">Logged Out Succesfully....
								!</div>
						</c:if>

						<form class="pt-3" action="${loginUrl}" method="post">
							<div class="form-group">
								<label for="exampleInputEmail">Username</label>
								<div class="input-group">
									<div class="input-group-prepend bg-transparent">
										<span class="input-group-text bg-transparent border-right-0">
											<i class="mdi mdi-account-outline text-primary"></i>
										</span>
									</div>
									<input type="text"
										class="form-control form-control-lg border-left-0"
										placeholder="Username" id="username" name="ssoId"
										required="required">
								</div>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword">Password</label>
								<div class="input-group">
									<div class="input-group-prepend bg-transparent">
										<span class="input-group-text bg-transparent border-right-0">
											<i class="mdi mdi-lock-outline text-primary"></i>
										</span>
									</div>
									<input type="password"
										class="form-control form-control-lg border-left-0"
										id="password" name="password" placeholder="Password"
										required="required">
								</div>
							</div>
							<div
								class="my-2 d-flex justify-content-between align-items-center">
								<div class="form-check">
									<label class="form-check-label text-muted"> <input
										type="checkbox" class="form-check-input" name="remember-me"
										id="rememberme"> Keep me signed in
									</label>
								</div>
								<a href="#" class="auth-link text-black">Forgot password?</a>
							</div>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							<div class="my-3">
								<button
									class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">LOGIN</button>
							</div>
							<!-- <div class="mb-2 d-flex">
									<button type="button"
										class="btn btn-facebook auth-form-btn flex-grow mr-1">
										<i class="mdi mdi-facebook mr-2"></i>Facebook
									</button>
									<button type="button"
										class="btn btn-google auth-form-btn flex-grow ml-1">
										<i class="mdi mdi-google mr-2"></i>Google
									</button>
								</div> -->
							<!-- <div class="text-center mt-4 font-weight-light">
									Don't have an account? <a href="register-2.html"
										class="text-primary">Create</a>
								</div> -->
						</form>
					</div>
				</div>
				<div class="col-lg-6 login-half-bg d-flex flex-row">
					<p
						class="text-white font-weight-medium text-center flex-grow align-self-end">Copyright
						&copy; 2018 All rights reserved.</p>
				</div>
			</div>
		</div>
		<!-- content-wrapper ends -->
	</div>
	<!-- page-body-wrapper ends -->
</div>
<div class="container">
	<div class="card card-login mx-auto text-center bg-dark">
		<div class="card-header mx-auto bg-dark">
			<span> <img
				src="${pageContext.request.contextPath }/static/images/addgrow.png"
				class="w-75" alt="Logo">
			</span><br /> <span class="logo_title mt-5"> Login </span>

		</div>
		<div class="card-body">
			<form action="" method="post">
				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-user"></i></span>
					</div>
					<input type="text" name="email" class="form-control"
						placeholder="Username">
				</div>

				<div class="input-group form-group">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-key"></i></span>
					</div>
					<input type="password" name="password" class="form-control"
						placeholder="Password">
				</div>

				<div class="form-group">
					<input type="submit" name="btn" value="Login"
						class="btn btn-outline-danger float-right login_btn">
				</div>

			</form>
		</div>
	</div>
</div>
 --%>