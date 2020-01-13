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
		font-size: 12px !important
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
		font-size: 10px !important
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
					style="font-family: 'Times New Roman'; border-bottom: 0.5px solid black;">Internship
					Joining Letter</span>
			</h3>

			<div class="text">

				Date: <strong>${ date }</strong> <br> Name: <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</strong>

			</div>

			<div class="text txt-body" style="padding: 20px">

				<br> Dear, <br>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With
				reference to your application and subsequent interaction during
				interview procedures, we are pleased to appoint you a position as
				Trainee in the <strong>ICEICO Talent Care</strong> department of
				ICEICO Technologies Pvt. Ltd. which is commence on Date:&nbsp;&nbsp;
				<strong style="border-bottom: 1px solid black;"> ${ joiningDate }</strong>&nbsp;&nbsp;
				and he/she pursing Internship in department <br>

				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We
				look forward to your arrival at ICEICO Technologies Pvt. Ltd.
			</div>

			<br>

			<div class="text">

				Yours faithfully, <br> HR Authority/Manager<br> <strong>ICEICO
					Technologies Pvt. Ltd.,<br>Nagpur
				</strong>

			</div>

			<div class="text" style="text-align: center">Note: If you have
				any queries of comments, please call me immediately.</div>

			<br> <br> <br>


		</div>

	</div>

</body>

</html>