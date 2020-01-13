<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#backimage {
	position: absolute;
	z-index: -1;
}
</style>



<body
	style="background-color: shokewhite; padding: 20px; font-size: 26px;"
	onload="window.print();">

	<c:if test="${ offer == false }">
		<div align="center" style="margin: 30%">
			<h1>${ errorMessage }</h1>
		</div>
	</c:if>
	<c:if test="${ offer == true }">
		<div class="backimage" id="backimage">
			<img
				src="${pageContext.request.contextPath }/static/img/iceico_letterHead.png"
				class="brand_logo" alt="Logo" style="width: 100%; height: 100%" />
		</div>


		<div
			style="padding: 50px; padding-left: 70px; font-family: 'Times New Roman'; text-align: justify;">
			<h3
				style="text-align: center; text-decoration: underline; margin-bottom: 0; font-family: 'Times New Roman';">
				<br> <br> <br> <br> <br>Internship
				Certificate

			</h3>
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
			<br>
			<div>

				This is certify that Mr./Ms. <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName },</strong>
				a student of &nbsp;<strong>${ collegeName }</strong>&nbsp; has
				successfully completed his/her <strong
					style="border-bottom: 1px solid #000;">${ duration }</strong>
				Internship Program starting from <strong>Dt.: ${ startDate }</strong>
				to <strong>Dt.: ${ endDate }</strong> at ICEICO Technologies Pvt.
				Ltd. <br> <br> During this period we found him/her
				sincere, hardworking, punctual, innovative and passionate towards
				his/her work. <br> <br> I wish all the best for his/her
				future. <br> <br>
				<div>
					Yours, <br> <br> HR Manager<br> <strong>
						ICEICO Technologies Pvt. Ltd.</strong><br> <strong> Nagpur</strong><br>
				</div>




			</div>




		</div>

	</c:if>
</body>
</html>