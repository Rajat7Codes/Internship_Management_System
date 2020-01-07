<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="window.print();">

	<img
		src="${pageContext.request.contextPath }/static/img/iceico_letterHead.png"
		class="brand_logo" alt="Logo" style="width: 100%; height: 100%" />

	<c:if test="${ offer == true }">
		<div align="center">
			<span
				style="border-bottom: 1px solid black; width: 30px; font-size: 26px; font-weight: bold; font-family: Times New Roman;">Internship
				Joining Letter</span>
		</div>
		<table
			style="margin-left: 22px; font-size: 26px; font-family: Times New Roman;">
			<tr>
				<td>Date :</td>
				<td><strong> <%-- ${dateAfterFifteenDays } --%>
				</strong></td>
			</tr>
			<tr>
				<td>Name :</td>
				<td><strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</strong></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>

		<table
			style="margin-left: 22px; font-size: 26px; width: 96%; font-family: Times New Roman;">
			<tr>
				<td>Dear,</td>
			</tr>
			<tr>
				<td><div style="text-indent: 60px;">
						With reference to your application and subsequent interaction
						during interview procedures, we are pleased to appoint you a
						position as Trainee in the <strong>ICEICO Talent Care</strong>
						department of ICEICO Technologies Pvt. Ltd. which is commence on
						Date:&nbsp;&nbsp; <strong style="border-bottom: 1px solid black;">
							${joiningDateInStandardFormat }</strong>&nbsp;&nbsp; and he/she pursing
						Internship in department
					</div></td>
			</tr>
			<tr>
				<td><div style="text-indent: 55px;">We look forward to
						your arrival at ICEICO Technologies Pvt. Ltd.</div></td>
			</tr>
			<!-- <tr>
					<td>Your's faithfully,</td>
				</tr> -->
		</table>
		<br>
		<br>
		<br>


		<div
			style="margin-left: 22px; font-family: Times New Roman; font-size: 26px;">Yours
			faithfully,</div>
		<br>
		<br>
		<br>
		<br>


		<table
			style="margin-left: 22px; font-size: 26px; font-family: Times New Roman;">
			<tr>
				<td>HR Authority/Manager</td>
			</tr>
			<tr>
				<td><strong>ICEICO Technologies Pvt. Ltd.,<br>Nagpur
				</strong></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>

		<h1 align="center" style="font-family: Times New Roman;">91,
			Ganesh Nagar, Nandanwan, Nagpur-09. Mob No.-8007004287 ,</h1>
		<h1 align="center" style="font-family: Times New Roman;">848586588.info@iceico.in.www.iceico.in</h1>



	</c:if>

</body>
</html>