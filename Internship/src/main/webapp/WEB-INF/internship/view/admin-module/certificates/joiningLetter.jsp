<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="window.print(); myDate();">

	<c:if test="${ offer == false }">
		<div align="center" style="margin: 30%">
			<h1>${errorMessage}</h1>
		</div>
	</c:if>

	<c:if test="${ offer == true }">
		<div
			style="border: 2px solid black; margin: 10px 10px 10px 10px; height: 1520px;">
			<br>
			<div align="center" style="margin-top: 10px;">
				<img
					src="${pageContext.request.contextPath }/static/img/Iceico_logo.png"
					class="brand_logo" alt="Logo" style="width: 20%;" />
			</div>
			<br>
			<div align="center">
				<span
					style="color: blue; font-size: 43px; font-weight: bold; font-family: sans-serif;">ICEICO
					Technologies Pvt Ltd</span>
			</div>


			<p align="right" style="margin-right: 20px">CIN-U74999MH2017PTC303106</p>

			<div align="center">
				<span
					style="border-bottom: 1px solid black; width: 30px; font-size: 20px; font-weight: bold;">Internship
					Joining Letter</span>
			</div>
			<br> <br> <br> <br>


			<table style="margin-left: 10px; font-size: 20px;">
				<tr>
					<td>Date :</td>
					<td>${dateAfterFifteenDays }</td>
				</tr>
				<tr>
					<td>Name :</td>
					<td>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</td>
				</tr>
			</table>
			<br> <br> <br> <br>

			<table style="margin-left: 10px; font-size: 20px; width: 98%;">
				<tr>
					<td>Dear,</td>
				</tr>
				<tr>
					<td>With reference to your application and subsequent
						interaction during interview procedures, we are pleased to appoint
						you a position as Trainee in the <strong>ICEICO Talent
							Care</strong> department of ICEICO Technologies Pvt. Ltd. which is
						commence on Date: <strong>${stud.date }</strong> and he/she
						pursing Internship in department
					</td>
				</tr>
				<tr>
					<td>We look forward to your arrival at ICEICO Technologies
						Pvt. Ltd.</td>
				</tr>
				<tr>
					<td>Your's faithfully,</td>
				</tr>
			</table>
			<br> <br> <br>


			<h4 style="margin-left: 20px;">Yours faithfully,</h4>
			<br> <br> <br> <br>


			<table style="margin-left: 10px; font-size: 20px;">
				<tr>
					<td>HR Authority/Manager</td>
				</tr>
				<tr>
					<td><strong>ICEICO Technologies Pvt. Ltd.,<br>Nagpur
					</strong></td>
				</tr>
			</table>
			<br> <br> <br> <br>

			<h1 align="center">91, Ganesh Nagar, Nandanwan, Nagpur-09. Mob
				No.-8007004287 ,</h1>
			<h1 align="center">848586588.info@iceico.in.www.iceico.in</h1>


		</div>
	</c:if>


	<script type="text/javascript">
		function myDate() {
			const today = new Date()
			//alert("date =====>>" + today);
			const tomorrow = new Date(today)
			tomorrow.setDate(tomorrow.getDate() + 15)
			//alert("next date =====>>" + tomorrow);
		}
	</script>

</body>
</html>