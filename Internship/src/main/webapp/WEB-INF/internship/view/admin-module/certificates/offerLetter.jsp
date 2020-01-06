<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="font-family: 'Times New Roman'; background-color: shokewhite; border: 2px solid black; padding: 20px; font-size: 26px;" onload="window.print();">

	<div>
		<div style="text-align: center">
			<img width="100px"
				src="${pageContext.request.contextPath }/static/img/Iceico_round.png">
			<h2 style="font-weight: bold; color: #000066">ICEICO Technologies Pvt. Ltd.</h2>
		</div>

		<p style="text-align: right">CIN - U74999MH2017PTC303106</p>

		<h3 style="text-align: center; text-decoration: underline;">
			Internship Offer Letter</h3>

		<div>
			Date: ${ currentDate } <br>
			Name: ${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName } 
		</div>
		<br>
		<br>
		<div>
				Dear ${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }, <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We are pleased to offer you Internship for Internship Program
				at ICEICO Technologies Pvt. Ltd. which will commence on Dt.:
				${ joiningDate }. This is paid internship program of complete ${ duration }
				program. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please report to HR (name of supervisor) on Dt.: ${ joiningDate } at
				10:00 am prior to your commencement of internship. There will be
				interview while you come for reporting. According your interview
				result your selection will be confirmed. You will be required to
				complete necessary personal forms Non-Competition and
				Confidentiality Agreement prior to your actual start date. <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We look forward to your arrival at ICEICO Technologies Pvt.
				Ltd.
		</div>
		<br>
		<br>
		<div>
			Yours faithfully, <br><br>
			HR Professional<br>
			ICEICO Technologies Pvt. Ltd.<br>
		</div> <br>
		<div style="text-align: center">Note: If you have any queries of comments, please call me immediately.</div>
		<br><br><br>
		<div style="text-align: center">
			<h3 style="font-weight: bold; color: #000066">
				91, Ganesh Nagar, Nandanvan, Nagpur-09 <img width="8px"
					src="https://img.icons8.com/material-outlined/24/000000/filled-circle--v1.png">Mob
				No. - 8007004287
			</h3>
			<h3 style="font-weight: bold; color: #000066">
				8485869588<img width="8px"
					src="https://img.icons8.com/material-outlined/24/000000/filled-circle--v1.png">info@iceico.in<img
					width="8px"
					src="https://img.icons8.com/material-outlined/24/000000/filled-circle--v1.png">www.iceico.in
			</h3>
		</div>
	</div>

</body>
</html>