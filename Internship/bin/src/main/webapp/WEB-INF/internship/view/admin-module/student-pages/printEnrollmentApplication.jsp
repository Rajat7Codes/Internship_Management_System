<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
</head>
<body onload="window.print();">
	<div style="margin: 1%;">
		<table style="width: 100%;">
			<tr>
				<td style="float: right;">ST/EX/421/Or-02/08-09/10TH</td>
			</tr>
			<tr>
				<th style="font-size: 25px;">SANT GADGE BABA AMRAVATI
					UNIVERSITY</th>
			</tr>
			<tr>
				<th style="font-size: 25px;">ENROLLMENT APPLICATION FORM</th>
			</tr>
			<tr>
				<td style="font-size: 25px; text-align: center;">SESSION&nbsp;${enrollmentApplication.academicSession}
				</td>
			</tr>

		</table>
		<table style="width: 100%;">
			<tr>
				<td style="float: left; width: 49%;">To,<br>The Controller
					of Exams,<br>Sant Gadge Baba Amravati University
				</td>
				<th style="float: right; width: 49%;">Enrollment No.<span
					style="border: 1px solid black;">${enrollmentApplication.enrollmentNumber }</span>
				</th>
			</tr>
		</table>
		<table style="width: 100%;">
			<tr>
				<td style="float: left; width: 49%;">Through:Principal:<span
					style="border-bottom: 1px solid black;"></span>
				</td>

			</tr>
			<tr>
				<td>Sir,</td>
			</tr>
			<tr>
				<td style="text-indent: 50px;">I request you to enroll me as a
					student of your University. So far I have not been enrolled as a
					collegiate student of Sant Gadge Baba Amravati University. I
					declare that I have not taken admission to any other course in any
					other college nor submitted the enrollment application form and
					also not admitted / not appearing for any other examination of the
					university as an external candidate/Ex-Student. The necessary
					information relating to me, is completely furnished as under.</td>
			</tr>
		</table>
		<hr>
		<h3 style="text-align: center; margin-top: -10px;">( To be filled
			by the student in his own hand writing )</h3>
		<table style="width: 100%; text-align: left;margin-bottom: -10px;margin-top: -10px;">
			<tr>
				<td style="width: 1%;">1.</td>
				<td style="width: 38%;">Full Name</td>
				<th style="width: 1%;">:</th>
				<th
					style="width: 15%; border-bottom: 1px solid black; text-align: center;">${enrollmentApplication.firstName }</th>
				<th
					style="width: 15%; border-bottom: 1px solid black; text-align: center;">${enrollmentApplication.motherName }</th>
				<th
					style="width: 15%; border-bottom: 1px solid black; text-align: center;">${enrollmentApplication.fatherName }</th>
				<th
					style="width: 15%; border-bottom: 1px solid black; text-align: center;">${enrollmentApplication.surName }</th>
			</tr>
			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;"></td>
				<th style="width: 1%;"></th>
				<td style="width: 15%; font-size: 12px; text-align: center;">FIRST
					NAME</td>
				<td style="width: 15%; font-size: 12px; text-align: center;">MOTHER'S
					NAME</td>
				<td style="width: 15%; font-size: 12px; text-align: center;">FATHER'S
					NAME</td>
				<td style="width: 15%; font-size: 12px; text-align: center;">SURNAME</td>

			</tr>
		</table>
		<table style="width: 100%; text-align: left;">
			<tr>
				<td style="width: 1%;">2.</td>
				<td style="width: 39%;">Date of Birth(As per Certificate of
					Education Board)</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="border-bottom: 1px solid black;">${enrollmentApplication.dob }</span></th>

			</tr>
			<tr>
				<td style="width: 1%;">3.</td>
				<td style="width: 39%;">Father's/Guardian's/Husband's Full Name</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="border-bottom: 1px solid black;">${enrollmentApplication.fatherName }&nbsp;${enrollmentApplication.surName }</span></th>
			</tr>
			<tr>
				<td style="width: 1%;">4.</td>
				<td style="width: 39%;">Permanent Address</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.completeAddress },${enrollmentApplication.zipcode }</span></th>
			</tr>
			<tr>
				<td style="width: 1%;">5.</td>
				<td style="width: 39%;">Caste</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.caste }</span></th>
			</tr>
			<tr>
				<td style="width: 1%;">6.</td>
				<td style="width: 39%;">a)Name of the course for which
					enrollment is sought</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.courseName }</span></th>
			</tr>
			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">b)Subject Offered</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.subjectOffered }</span></th>
			</tr>
			<tr>
				<td style="width: 1%;">7.</td>
				<td style="width: 38%;">Medium of Instruction</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.moi }</span></th>
			</tr>
		</table>
		<table style="width: 100%; text-align: left;">
			<tr>
				<td style="width: 1%;">8.</td>
				<td style="width: 99%;" colspan="2">Information regarding
					qualifying examination as an eligibility for enrollment</td>
			</tr>
		</table>
		<table style="width: 100%; text-align: left;">
			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">a) Name of the Exam</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.noe }</span></th>
			</tr>

			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">b) Name of Board/University</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.nobu }</span></th>
			</tr>
		</table>
		<table style="width: 100%; text-align: left;">
			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">c) Year of passing Summer/Winter &emsp;<span
					style="word-break: break-word; border-bottom: 1px solid black;"><strong>${enrollmentApplication.passingYear }</strong></span></td>
				<td style="width: 60%;">d)Roll No.<span
					style="word-break: break-word; border-bottom: 1px solid black;"><strong>${enrollmentApplication.rollNumber }</strong></span></td>
			</tr>
		</table>
		<table style="width: 100%; text-align: left;">
			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">e) Percentage of marks obtained</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.caste }</span></th>
			</tr>

			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">f) Name of previous College</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.previousCollegeName }</span></th>

			</tr>
			<tr>
				<td style="width: 1%;"></td>
				<td style="width: 39%;">g) Subject offered for Exam</td>
				<th style="width: 1%;">:</th>
				<th style="width: 59%;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.subOffExam }</span></th>
			</tr>
			<tr>
				<td style="width: 1%;">9.</td>
				<td style="width: 39%;">Date of admission in college</td>
				<th style="width: 1%;">:</th>
				<td style="width: 59%;">Date&nbsp;<strong><span
						style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.doaDD }</span></strong>&emsp;Month&nbsp;<strong><span
						style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.doaMonth }</span></strong>&emsp;Year&nbsp;<strong><span
						style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.doaYear }</span></strong></td>
			</tr>
		</table>
		<table style="width: 100%; text-align: left;">
			<tr>
				<td style="width: 1%;">10.</td>
				<td style="width: 40%;">Receipt No. & Date of Enrollment fee of
					Rs.</td>
				<td style="width: 59%;"><strong><span
						style="word-break: break-word; border-bottom: 1px solid black;">50/-</span><span
						style="word-break: break-word; border-bottom: 1px solid black;">(In
							words)</span></strong> &emsp;11) Paid in College:<strong><span
						style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.paidInCollege}</span></strong>
			</tr>
		</table>
		<hr>
		<table style="width: 100%;margin-top: -10px;">
			<tr>
				<td style="text-indent: 20px;">I solemnly afirm that the
					information given above is correct in all respects, and have not
					got enrolled my name in any other university or in College. I have
					offered only the medium & the subjects which are permitted to the
					college by the University.Further,I have taken admission
					College/Department with an undertaking as required U/S 95 (7) 95
					(8) of Maharashtra University Act,1994.</td>
			</tr>
		</table>
		<table style="width: 100%;margin-bottom: -10px;">
			<tr>
				<td style="width: 20%;">Complete Address :</td>
				<th style="width: 50%; text-align: left;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.completeAddress }</span></th>
				<td
					style="word-break: break-word; border-bottom: 1px solid black; width: 30%;"></td>

			</tr>
			<tr>
				<td></td>
				<th style="width: 50%; text-align: left;"><span
					style="word-break: break-word; border-bottom: 1px solid black;">${enrollmentApplication.zipcode }</span></th>
				<td style="word-break: break-word;">Applicant's Full Signature</td>

			</tr>
			<tr>
				<td>Date:</td>
			</tr>
		</table>
		<hr>
		<table style="width: 100%;margin-top: -10px;">
			<tr>
				<td style = "text-indent: 20px;">I have satisfied that the student has passed the
					examination which is an eligibilty qualification for enrollment as
					per University Ordinance. He has been admitted for course of study
					in only those subjects which are permitted to the college by the
					University. He is eligible in all respects for being enrolled as
					Collegiate student of the University as per rules.He is recommended
					for enrollment.</td>
			</tr>

		</table>
		<table style="width: 100%;margin-top: 2%;">
			<tr>
				<td style="float: left;">Date :</td>
				<td style="float: right;">Principal's Signature & Seal</td>
			</tr>
		</table>


	</div>
</body>
</html>