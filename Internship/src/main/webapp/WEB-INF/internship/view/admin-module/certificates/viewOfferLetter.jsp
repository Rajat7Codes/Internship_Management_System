<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Offer Letter View</title>
</head>
<style>
.header {
	margin-top: 25%;
}

.text {
	padding-left: 10px;
	padding-right: 10px;
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
			<h3 class="text-center header" style="font-family: times new roman;font-weight: bold;">
				<u>Internship Offer Letter</u>
			</h3>
			<div class="text">
				Date: <strong>${ currentDate }</strong> <br> Name: <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</strong>
			</div>
			<div class="text txt-body">
				<br> Dear <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName },</strong>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We
				are pleased to offer you Internship for Internship Program at ICEICO
				Technologies Pvt. Ltd. which will commence on Dt.: <strong>${ joiningDate }</strong>.
				This is paid internship program of complete <strong>${ duration }</strong>
				program. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please
				report to HR (name of supervisor) on Dt.: <strong>${ joiningDate }</strong>
				at 10:00 am prior to your commencement of internship. There will be
				interview while you come for reporting. According your interview
				result your selection will be confirmed. You will be required to
				complete necessary personal forms Non-Competition and
				Confidentiality Agreement prior to your actual start date. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We
				look forward to your arrival at ICEICO Technologies Pvt. Ltd.
			</div>
			<br>
			<div class="text">
				Yours faithfully, <br> HR Professional<br> ICEICO
				Technologies Pvt. Ltd.<br>
			</div>

			<div class="text" style="text-align: center">Note: If you have
				any queries of comments, please call me immediately.</div>
			<br> <br> <br>

		</div>
	</div>
</body>
</html>