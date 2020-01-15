


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>

<style>
.header {
	margin-top: 25%;
}

@media ( max-width : 650px) {
	.header {
		font-size: 20px !important
	}
	.text {
		font-size: 12px !important
	}
}

@media ( max-width : 550px) {
	.header {
		font-size: 16px !important
	}
	.text {
		font-size: 10px !important
	}
}

@media ( max-width : 500px) {
	.header {
		font-size: 12px !important;
		margin-top: 20% !important;
		margin-bottom: 0px !important;
	}
	.card-img-overlay {
		padding: 30px !important;
	}
	.text {
		font-size: 8px !important
	}
}

@media ( max-width : 350px) {
	.header {
		font-size: 8px !important;
		margin-top: 15% !important;
	}
	.card-img-overlay {
		padding: 20px !important;
	}
	.text {
		font-size: 6px !important
	}
}

@media ( max-width : 285px) {
	.header {
		font-size: 6px !important;
	}
	.card-img-overlay {
		padding: 16px !important;
	}
	.text {
		font-size: 5px !important
	}
}
</style>

<body>

	<div class="card" style="width: 100%; height: 100%">

		<img class="card-img-top"
			src="${pageContext.request.contextPath }/static/img/iceico_letterHead.png"
			alt="Card image">

		<div class="card-img-overlay"
			style="padding: 40px; padding-left: 50px; font-family: 'Times New Roman';">




			<h3 class="text-center header">
				<span
					style="font-family: 'Times New Roman'; border-bottom: 0.5px solid black; font-weight: bold;"><u>Internship
					Certificate</u></span>
			</h3>
			<div class="text">


				Date: <strong>${ currentDate }</strong>
			</div>


			<div>
				<h3 class="text-center header"
					style="text-align: center; margin-bottom: 0; margin-top: 0; font-family: 'Times New Roman';">
					<span style="border-bottom: 1px solid #000;">TO WHOM IT MAY
						CONCERN</span>
				</h3>

			</div>
			<div class="text txt-body">

				<br> This is certify that Mr./Ms. <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName },</strong>
				a student of &nbsp;<strong>${ collegeName }</strong>&nbsp; has
				successfully completed his/her <strong
					style="border-bottom: 1px solid #000;">${ duration }</strong>
				Internship Program starting from <strong>Dt.: ${ startDate }</strong>
				to <strong>Dt.: ${ endDate }</strong> at ICEICO Technologies Pvt.
				Ltd. <br> <br> During this period we found him/her
				sincere, hardworking, punctual, innovative and passionate towards
				his/her work. <br> I wish all the best for his/her future. <br>
			</div>

			<br>

			<div class="text">

				Yours faithfully, <br> HR Manager<br> ICEICO Technologies
				Pvt. Ltd.<br>

			</div>



			<br> <br> <br>


		</div>

	</div>

</body>

</html>


<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.header {
	margin-top: 25%;
}

@media ( max-width : 650px) {
	.header {
		font-size: 20px !important
	}
	.text {
		font-size: 12px !important
	}
}

@media ( max-width : 550px) {
	.header {
		font-size: 16px !important
	}
	.text {
		font-size: 10px !important
	}
}

@media ( max-width : 500px) {
	.header {
		font-size: 12px !important;
		margin-top: 20% !important;
		margin-bottom: 0px !important;
	}
	.card-img-overlay {
		padding: 30px !important;
	}
	.text {
		font-size: 8px !important
	}
}

@media ( max-width : 350px) {
	.header {
		font-size: 8px !important;
		margin-top: 15% !important;
	}
	.card-img-overlay {
		padding: 20px !important;
	}
	.text {
		font-size: 6px !important
	}
}

@media ( max-width : 285px) {
	.header {
		font-size: 6px !important;
	}
	.card-img-overlay {
		padding: 16px !important;
	}
	.text {
		font-size: 5px !important
	}
}
</style>
<body
	style="background-color: shokewhite; padding: 30px; font-size: 26 px;">

	<div class="card img-fluid">

		<img class="card-img-top brand_logo"
			src="${pageContext.request.contextPath }/static/img/iceico_letterHead.png"
			alt="Logo" style="width: 100%; height: 75% !important" />
		<div class="card-img-overlay"
			style="padding: 50px; padding-left: 70px; font-family: ' Times New Roman '; text-align: justify;">
			<h3
				style="text-align: center; text-decoration: underline; margin-bottom: 0; font-family: 'Times New Roman';">
				<br> <br> <br> <br> <br>Internship
				Certificate

			</h3>

			<br> <br>
			<div>
				Date: <strong>${ currentDate }</strong>
			</div>



			<div>
				<h3
					style="text-align: center; margin-bottom: 0; font-family: 'Times New Roman';">
					<span style="border-bottom: 1px solid #000;">TO WHOM IT MAY
						CONCERN</span>
				</h3>

			</div>
			<br> <br> <br>
			<div>

				This is certify that Mr./Ms. <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName },</strong>
				a student of &nbsp;<strong>${ collegeName }</strong>&nbsp; has
				successfully completed his/her <strong
					style="border-bottom: 1px solid #000;">${ duration }</strong>
				Internship Program starting from <strong>Dt.: ${ startDate }</strong>
				to <strong>Dt.: ${ endDate }</strong> at ICEICO Technologies Pvt.
				Ltd. <br> <br> During this period we found him/her
				sincere, hardworking, punctual, innovative and passionate towards
				his/her work. <br> I wish all the best for his/her future. <br>
				<div>
					Yours, <br> <br> HR Manager<br> <strong>
						ICEICO Technologies Pvt. Ltd.</strong><br> <strong> Nagpur</strong>
				</div>

			</div>

		</div>

	</div>

</body>
</html> --%>