<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>

</head>
<body>
	<div id="firstReceipt">
		<div
			style="font-family: 'Times New Roman'; background-color: whitesmoke; border: 2px solid black; padding: 20px; font-size: 20px;">
			<table style="width: 100%;">
				<tr>
					<td><img width="300px"
						src="${pageContext.request.contextPath }/static/img/Iceico_logo.png">
					</td>
					<td style="text-align: right;">Mo. 8007004287, 8485869588 <br>
						Web : www.iceico.in <br> Email : info@iceico.in <br>
						Plot No.91, Ganesh Nagar, Nandanvan, Nagpur - 09
					</td>
				</tr>
			</table>
			<div
				style="margin: 20px 0px; padding: 2px; border-top: 2px solid black; border-bottom: 2px solid black;"></div>
			<table style="width: 100%;">
				<tr>
					<td>Sr. No. <span
						style="color: red !important; -webkit-print-color-adjust: exact;">
							<strong> ${ fees.feesId }</strong>
					</span></td>
					<td
						style="display: block; float: left; width: 68%; text-align: right;">Date</td>
					<td
						style="display: block; float: right; width: 30%; border-bottom: 1px solid black;"><strong>
							${ fees.date }</strong></td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 25%;">Received
						with thanks from</td>
					<td
						style="display: block; float: right; width: 75%; border-bottom: 1px solid black;">
						&nbsp;<strong> ${ studentEntry.firstName }</strong>
					</td>
				</tr>
			</table>
			<br>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 15%;">The Sum
						of Rs.</td>
					<td
						style="display: block; float: right; width: 85%; border-bottom: 1px solid black;">
						<strong id="inWords"></strong> &nbsp;
					</td>
				</tr>
			</table>

			<br>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 26%;">By Cash /
						D.D. / Cheque No.</td>
					<td
						style="display: block; float: left; width: 16%; border-bottom: 1px solid black;">
						&nbsp; <strong>${ fees.payMode }</strong>
					</td>
					<td style="display: block; float: left; width: 8%;">of dates</td>
					<td
						style="display: block; float: left; width: 20%; border-bottom: 1px solid black;">
						&nbsp; <strong> ${ fees.date }</strong>
					</td>
					<td style="display: block; float: left; width: 7%;">Bank</td>
					<td
						style="display: block; float: left; width: 23%; border-bottom: 1px solid black;">
						&nbsp; <strong>${ fees.bank }</strong>
					</td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 24%;">as Part /
						Full payment of</td>
					<td
						style="display: block; float: left; width: 76%; border-bottom: 1px solid black;">
						&nbsp; <strong>Internship</strong>
					</td>
				</tr>
			</table>
			<br> <br>
			<table style="width: 100%;">
				<tr>
					<td style="float: left;">Rs. &nbsp;&nbsp;</td>
					<td style="float: left; border-bottom: 1px solid black;">
						&nbsp; <strong id="amount">${ fees.feesAmount }</strong>
					</td>
					<td style="float: right;">For. ICEICO TECHNOLOGIES PVT. LTD.</td>
				</tr>
			</table>
		</div>
	</div>

	<!-- Repeat Here..... -->
	<br>
	<br>
	<br>
	<br>
	<div id="secondReceipt">
		<div
			style="font-family: 'Times New Roman'; background-color: whitesmoke; border: 2px solid black; padding: 20px; font-size: 20px;">
			<table style="width: 100%;">
				<tr>
					<td><img width="300px"
						src="${pageContext.request.contextPath }/static/img/Iceico_logo.png">
					</td>
					<td style="text-align: right;">Mo. 8007004287, 8485869588 <br>
						Web : www.iceico.in <br> Email : info@iceico.in <br>
						Plot No.91, Ganesh Nagar, Nandanvan, Nagpur - 09
					</td>
				</tr>
			</table>
			<div
				style="margin: 20px 0px; padding: 2px; border-top: 2px solid black; border-bottom: 2px solid black;"></div>
			<table style="width: 100%;">
				<tr>
					<td>Sr. No. <span
						style="color: red !important; -webkit-print-color-adjust: exact;">
							<strong> ${ fees.feesId }</strong>
					</span></td>
					<td
						style="display: block; float: left; width: 68%; text-align: right;">Date</td>
					<td
						style="display: block; float: right; width: 30%; border-bottom: 1px solid black;"><strong>
							${ fees.date }</strong></td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 25%;">Received
						with thanks from</td>
					<td
						style="display: block; float: right; width: 75%; border-bottom: 1px solid black;">
						&nbsp;<strong> ${ studentEntry.firstName }</strong>
					</td>
				</tr>
			</table>
			<br>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 15%;">The Sum
						of Rs.</td>
					<td
						style="display: block; float: right; width: 85%; border-bottom: 1px solid black;">
						<strong id="inWords2"></strong> &nbsp;
					</td>
				</tr>
			</table>

			<br>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 26%;">By Cash /
						D.D. / Cheque No.</td>
					<td
						style="display: block; float: left; width: 16%; border-bottom: 1px solid black;">
						&nbsp; <strong>${ fees.payMode }</strong>
					</td>
					<td style="display: block; float: left; width: 8%;">of dates</td>
					<td
						style="display: block; float: left; width: 20%; border-bottom: 1px solid black;">
						&nbsp; <strong> ${ fees.date }</strong>
					</td>
					<td style="display: block; float: left; width: 7%;">Bank</td>
					<td
						style="display: block; float: left; width: 23%; border-bottom: 1px solid black;">
						&nbsp; <strong>${ fees.bank }</strong>
					</td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td style="display: block; float: left; width: 24%;">as Part /
						Full payment of</td>
					<td
						style="display: block; float: left; width: 76%; border-bottom: 1px solid black;">
						&nbsp; <strong>Internship</strong>
					</td>
				</tr>
			</table>
			<br> <br>
			<table style="width: 100%;">
				<tr>
					<td style="float: left;">Rs. &nbsp;&nbsp;</td>
					<td style="float: left; border-bottom: 1px solid black;">
						&nbsp; <strong id="amount">${ fees.feesAmount }</strong>
					</td>
					<td style="float: right;">For. ICEICO TECHNOLOGIES PVT. LTD.</td>
				</tr>
			</table>
		</div>
	</div>




	<script type="text/javascript">
		var a = [ '', 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ',
				'Seven ', 'Eight ', 'Nine ', 'Ten ', 'Eleven ', 'Twelve ',
				'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Seventeen ',
				'Eighteen ', 'Nineteen ' ];
		var b = [ '', '', 'Twenty', 'Thirty', 'Fourty', 'Fifty', 'Sixty',
				'Seventy', 'Eighty', 'Ninety' ];

		function inWords(num) {
			var number = parseInt(num);
			if ((number = number.toString()).length > 9)
				return 'overflow';
			n = ('000000000' + number).substr(-9).match(
					/^(\d{2})(\d{2})(\d{2})(\d{1})(\d{2})$/);
			if (!n)
				return;
			var str = '';
			str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' '
					+ a[n[1][1]])
					+ 'crore ' : '';
			str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' '
					+ a[n[2][1]])
					+ 'lakh ' : '';
			str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' '
					+ a[n[3][1]])
					+ 'thousand ' : '';
			str += (n[4] != 0) ? (a[Number(n[4])] || b[n[4][0]] + ' '
					+ a[n[4][1]])
					+ 'hundred ' : '';
			str += (n[5] != 0) ? ((str != '') ? 'and ' : '')
					+ (a[Number(n[5])] || b[n[5][0]] + ' ' + a[n[5][1]]) + ' '
					: '';
			return str;

		}
		$(document)
				.ready(
						function() {
							document.getElementById('inWords').innerHTML = inWords(document
									.getElementById('amount').innerHTML);
							document.getElementById('inWords2').innerHTML = inWords(document
									.getElementById('amount').innerHTML);

							window.print();
						});
	</script>



</body>

</html>