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
	height: 116% !important;
	width: 96%;
}
</style>
<body
	style="background-color: shokewhite; padding: 20px; font-size: 26px;"
	onload=" myFunction2();">

	<c:if test="${ offer == false }">
		<div align="center" style="margin: 30%">
			<h1>${errorMessage}</h1>
		</div>
	</c:if>
	<c:if test="${ offer == true }">

		<div class="backimage" id="backimage">
			<img
				src="${pageContext.request.contextPath }/static/img/iceico_letterHead.png"
				class="brand_logo" alt="Logo" style="width: 100%; height: 100%" />
		</div>

		<div
			style="height: 100%; padding: 50px; padding-left: 70px; font-family: 'Times New Roman';">
			<h3
				style="text-align: center; text-decoration: underline; margin-bottom: 0; font-family: 'Times New Roman';">
				<br> <br> <br> <br> <br>Internship Offer
				Letter
			</h3>
			<div>
				Date: <strong>${ oneDayBeforeDate }</strong> <br> Name: <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</strong>
			</div>
			<br>
			<div>
				Dear <strong>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName },</strong>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;We
				are pleased to offer you Internship for Internship Program at ICEICO
				Technologies Pvt. Ltd. which will commence on Dt.: <strong
					id="joinDate">${ joiningDate }</strong>. This is paid internship
				program of complete <strong>${ duration }</strong> program. <br>
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
			<div id="holidayJson">${holidaysJson }</div>
			<div>
				Yours faithfully, <br> HR Professional<br> ICEICO
				Technologies Pvt. Ltd.<br>
			</div>

			<div style="text-align: center">Note: If you have any queries
				of comments, please call me immediately.</div>
			<br> <br> <br>

		</div>
	</c:if>
</body>


<script type="text/javascript">
	function myFunction2() {
		window.print();
		var joiningDAte = document.getElementById('joinDate').innerHTML;
		//alert("joiningDAte =====>>>" + joiningDAte);
		var holidayJson = document.getElementById('holidayJson').innerHTML;
		//alert("holidayJson =====>>>" + holidayJson);

		//alert("parseJson =====>>>" + JSON.parse(holidayJson));
	}
</script>






</html>