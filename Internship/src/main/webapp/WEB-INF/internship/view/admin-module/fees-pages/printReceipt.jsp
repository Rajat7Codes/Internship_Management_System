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
<body>
	<div style="font-family: 'Times New Roman'; background-color: whitesmoke; border: 2px solid black; padding: 20px; font-size: 20px;">
		<table style="width: 100%;">
			<tr>
				<td><img width="300px" src="${pageContext.request.contextPath }/static/img/Iceico_logo.png">
				</td>
				<td style="text-align: right;">Mo. 8007004287, 8485869588 <br>
					Web : www.iceico.in <br> Email : info@iceico.in <br> Plot
					No.91, Ganesh Nagar, Nandanvan, Nagpur - 09
				</td>
			</tr>
		</table>
		<div style="margin: 20px 0px; padding:2px; border-top: 2px solid black; border-bottom: 2px solid black;"></div>
		<table style="width: 100%;">
			<tr>
				<td>Sr. No. <span style="color: red !important; -webkit-print-color-adjust: exact;  "> <strong> ${ fees.feesId }</strong> </span></td>
				<td style="display: block; float: left; width: 68%; text-align: right;">Date</td>
				<td style="display: block; float: right; width: 30%; border-bottom: 1px solid black;"><strong> ${ fees.date }</strong></td>
			</tr>
		</table>
		<table style="width: 100%;">
			<tr>
				<td style="display: block; float: left; width: 25%;">Received with thanks from</td>
				<td style="display: block; float: right; width: 75%; border-bottom: 1px solid black;">
					&nbsp;<strong> ${ studentEntry.firstName }</strong></td>
			</tr>
			<br>
		</table>
		<br>
		<table style="width: 100%;">
			<tr>
				<td style="display: block; float: left; width: 15%;">The Sum of Rs.</td>
				<td id="inWords" style="display: block; float: right; width: 85%; border-bottom: 1px solid black;"> &nbsp; </td>
			</tr>
		</table>
		<script>
			amount = ${fees.feesAmount};

			function convertNumberToWords(num) {
				var words = new Array();
				words[0] = '';
				words[1] = 'One';
				words[2] = 'Two';
				words[3] = 'Three';
				words[4] = 'Four';
				words[5] = 'Five';
				words[6] = 'Six';
				words[7] = 'Seven';
				words[8] = 'Eight';
				words[9] = 'Nine';
				words[10] = 'Ten';
				words[11] = 'Eleven';
				words[12] = 'Twelve';
				words[13] = 'Thirteen';
				words[14] = 'Fourteen';
				words[15] = 'Fifteen';
				words[16] = 'Sixteen';
				words[17] = 'Seventeen';
				words[18] = 'Eighteen';
				words[19] = 'Nineteen';
				words[20] = 'Twenty';
				words[30] = 'Thirty';
				words[40] = 'Forty';
				words[50] = 'Fifty';
				words[60] = 'Sixty';
				words[70] = 'Seventy';
				words[80] = 'Eighty';
				words[90] = 'Ninety';
				amount = amount.toString();
				var atemp = amount.split(".");
				var number = atemp[0].split(",").join("");
				var n_length = number.length;
				var words_string = "";
				if (n_length <= 9) {
					var n_array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0);
					var received_n_array = new Array();
					for (var i = 0; i < n_length; i++) {
						received_n_array[i] = number.substr(i, 1);
					}
					for (var i = 9 - n_length, j = 0; i < 9; i++, j++) {
						n_array[i] = received_n_array[j];
					}
					for (var i = 0, j = 1; i < 9; i++, j++) {
						if (i == 0 || i == 2 || i == 4 || i == 7) {
							if (n_array[i] == 1) {
								n_array[j] = 10 + parseInt(n_array[j]);
								n_array[i] = 0;
							}
						}
					}
					value = "";
					for (var i = 0; i < 9; i++) {
						if (i == 0 || i == 2 || i == 4 || i == 7) {
							value = n_array[i] * 10;
						} else {
							value = n_array[i];
						}
						if (value != 0) {
							words_string += words[value] + " ";
						}
						if ((i == 1 && value != 0)
								|| (i == 0 && value != 0 && n_array[i + 1] == 0)) {
							words_string += "Crores ";
						}
						if ((i == 3 && value != 0)
								|| (i == 2 && value != 0 && n_array[i + 1] == 0)) {
							words_string += "Lakhs ";
						}
						if ((i == 5 && value != 0)
								|| (i == 4 && value != 0 && n_array[i + 1] == 0)) {
							words_string += "Thousand ";
						}
						if (i == 6 && value != 0
								&& (n_array[i + 1] != 0 && n_array[i + 2] != 0)) {
							words_string += "Hundred and ";
						} else if (i == 6 && value != 0) {
							words_string += "Hundred ";
						}
					}
					words_string = words_string.split("  ").join(" ");
				}
				return words_string;
			}

			document.getElementById('inWords').innerHTML = '<strong>&nbsp;'
					+ convertNumberToWords(amount)+'</strong>';
			window.print();
		</script>
		<br>
		<table style="width: 100%;">
			<tr>
				<td style="display: block; float: left; width: 26%;">By Cash / D.D. / Cheque No.</td>
				<td style="display: block; float: left; width: 16%; border-bottom: 1px solid black;"> &nbsp; <strong>${ fees.payMode }</strong></td>
				<td style="display: block; float: left; width: 8%;">of dates</td>
				<td style="display: block; float: left; width: 20%; border-bottom: 1px solid black;"> &nbsp; <strong> ${ fees.date }</strong></td>
				<td style="display: block; float: left; width: 7%;">Bank</td>
				<td style="display: block; float: left; width: 23%; border-bottom: 1px solid black;"> &nbsp; <strong>${ fees.bank }</strong></td>
			</tr>
		</table>
		<table style="width: 100%;">
			<tr>
				<td style="display: block; float: left; width: 24%;">as Part / Full payment of</td>
				<td
					style="display: block; float: left; width: 76%; border-bottom: 1px solid black;">
					&nbsp; <strong>Internship</strong></td>
			</tr>
			<br>
		</table>
		<br>
		<br>
		<table style="width: 100%;">
			<tr>
				<td style="float: left;">Rs. &nbsp;&nbsp;</td>
				<td style="float: left; border-bottom: 1px solid black;">
					&nbsp; <strong>${ fees.feesAmount }</strong></td>
				<td style="float: right;">For. ICEICO TECHNOLOGIES PVT. LTD.</td>
			</tr>
		</table>

	</div>
</body>

</html>