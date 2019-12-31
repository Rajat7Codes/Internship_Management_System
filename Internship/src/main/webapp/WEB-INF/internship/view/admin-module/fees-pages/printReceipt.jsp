<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">

	</style>
</head>

<body style="background-color: whitesmoke; border: 2px solid grey; padding: 20px; margin: auto;  width: 90%;" onload="window.print()">
	<table style="width: 100%;">
		<tr>
			<td>
				<img width="230px" src="${pageContext.request.contextPath }/static/img/Iceico_logo.png">
			</td>
			<td style="text-align: right;">
				Mo. 8007004287, 8485869588 <br>
				Web : www.iceico.in <br>
				Email : info@iceico.in <br>
				Plot No.91, Ganesh Nagar, Nandanvan, Nagpur - 09
			</td>
		</tr>
	</table>
	<hr style="background:black; margin-bottom: 0.1em;"/> 
	<hr style="background:black; margin-top: 0.1em;"/>
	<table style="width: 100%;">
		<tr>
			<td>Sr. No. ${ fees.feesId }</td>
			<td style="display: block; float: left; width: 55%; text-align: right;" >Date</td>
			<td style="display: block; float: right; width: 40%; border-bottom: 1px solid black;">${ fees.date }</td>
		</tr>
	</table>
	<table style="width: 100%;">
		<tr>
			<td style="display: block; float: left; width: 31%;">Received with thanks from </td>
			<td style="display: block; float: right; width: 68%; border-bottom: 1px solid black;"> &nbsp; ${ studentEntry.firstName }</td>
		</tr>
		<br>
		<tr>
			<td style="border-bottom: 1px solid black; width: 100%;"> &nbsp;</td>
		</tr>
	</table>
	<br>
	<table style="width: 100%;">
		<tr>
			<td style="display: block; float: left; width: 19%;">The Sum of Rs.</td>
			<td style="display: block; float: right; width: 80%; border-bottom: 1px solid black;"> &nbsp; </td>
		</tr>
	</table>
	<br>
	<table style="width: 100%;">
		<tr>
			<td style="display: block; float: left; width: 30%;">By Cash / D.D. / Cheque No.</td>
			<td style="display: block; float: left; width: 18%; border-bottom: 1px solid black;"> &nbsp; ${ fees.payMode } </td>
			<td style="display: block; float: left; width: 9%;">of dates</td>
			<td style="display: block; float: left; width: 15%; border-bottom: 1px solid black;"> &nbsp; ${ fees.date } </td>
			<td style="display: block; float: left; width: 6%;">Bank</td>
			<td style="display: block; float: left; width: 20%; border-bottom: 1px solid black;"> &nbsp; ${ fees.bankName } </td>
		</tr>
	</table>
	<table style="width: 100%;">
		<tr>
			<td style="display: block; float: left; width: 30%;">as Part / Full payment of</td>
			<td style="display: block; float: left; width: 69%; border-bottom: 1px solid black;"> &nbsp; ${ fees.feesAmount }  </td>
		</tr>
		<br>
		<tr>
			<td style="border-bottom: 1px solid black; width: 100%;"> &nbsp;</td>
		</tr>
	</table>
	<br><br>
	<table style="width: 100%;">
		<tr>
			<td style="float: left;"> Rs. </td>
			<td style="float: left; border-bottom: 1px solid black;"> ${ fees.feesAmount } </td>
			<td style=" float: right;"> For. ICEICO TECHNOLOGIES PVT. LTD. </td>
		</tr>
	</table>
</body>

</html>