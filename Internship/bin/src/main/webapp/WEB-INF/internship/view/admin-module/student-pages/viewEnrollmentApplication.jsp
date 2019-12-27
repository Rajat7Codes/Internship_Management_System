<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
label {
	padding-top: 10px;
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="row">

		<form:form modelAttribute="enrollmentApplication"
			name="enrollmentApplicationForm" id="enrollmentApplicationForm">

			<form:hidden path="enAppId" />
			<form:hidden path="ssoId" />

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> ENROLLMENT
							APPLICATION FORM </strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body">

						<div class="row form-group">
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="enrollmentNumber">Enrollment #</form:label>
								<form:input path="enrollmentNumber" name="enrollmentNumber"
									id="enrollmentNumber" class="form-control"
									placeholder="Enrollment #" readonly="true" />
								<form:errors path="enrollmentNumber"></form:errors>
							</div>
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="date">Date</form:label>
								<form:input path="date" name="date" id="date"
									class="form-control" type="date" readonly="true" />
								<form:errors path="date"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="firstName">First Name</form:label>
								<form:input path="firstName" name="firstName" id="firstName"
									class="form-control" placeholder="First Name" readonly="true" />
								<form:errors path="firstName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="fatherName">Father Name</form:label>
								<form:input path="fatherName" name="fatherName" id="fatherName"
									class="form-control" placeholder="Father Name" readonly="true" />
								<form:errors path="fatherName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="surName">Last Name</form:label>
								<form:input path="surName" name="surName" id="surName"
									class="form-control" placeholder="Last Name" readonly="true" />
								<form:errors path="surName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="motherName">Mother Name</form:label>
								<form:input path="motherName" name="motherName" id="motherName"
									class="form-control" placeholder="Mother Name" readonly="true" />
								<form:errors path="motherName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="dob">DOB</form:label>
								<form:input path="dob" name="dob" id="dob" class="form-control"
									type="date" readonly="true" />
								<form:errors path="dob"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="caste">Caste</form:label>
								<form:input path="caste" name="caste" id="caste"
									class="form-control" placeholder="Caste" readonly="true" />
								<form:errors path="caste"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> EDUCATIONAL
							DETAILS </strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body">
						<div class="row form-group">
							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="courseName">Course Name</form:label>
								<form:input path="courseName" name="courseName" id="courseName"
									class="form-control" placeholder="Course Name" readonly="true" />
								<form:errors path="courseName"></form:errors>
							</div>
							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="subjectOffered">Subject Offered</form:label>
								<form:input path="subjectOffered" name="subjectOffered"
									id="subjectOffered" class="form-control"
									placeholder="Subject Offered" readonly="true" />
								<form:errors path="subjectOffered"></form:errors>
							</div>
							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="moi">Medium of Instruction</form:label>
								<form:input path="moi" name="moi" id="moi" class="form-control"
									placeholder="Medium of Instruction" readonly="true" />
								<form:errors path="moi"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> QUALIFYING
							EXAMINATION DETAILS </strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body">
						<div class="row form-group">
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="noe">Exam Name</form:label>
								<form:input path="noe" name="noe" id="noe" class="form-control"
									placeholder="Exam Name" readonly="true" />
								<form:errors path="noe"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="nobu">Board/University</form:label>
								<form:input path="nobu" name="nobu" id="nobu"
									class="form-control" placeholder="Board/University"
									readonly="true" />
								<form:errors path="nobu"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="passingYear">Passing Year</form:label>
								<form:input path="passingYear" name="passingYear"
									id="passingYear" class="form-control"
									placeholder="Passing Year" readonly="true" />
								<form:errors path="passingYear"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="passingSession">Passing Session</form:label>
								<form:input path="passingSession" name="passingSession"
									id="passingSession" class="form-control"
									placeholder="Passing Session" readonly="true" />
								<form:errors path="passingSession"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="rollNumber">Roll #</form:label>
								<form:input path="rollNumber" name="rollNumber" id="rollNumber"
									class="form-control" placeholder="Roll #" readonly="true" />
								<form:errors path="rollNumber"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="percentage">Percentage</form:label>
								<form:input path="percentage" name="percentage" id="percentage"
									class="form-control" placeholder="Percentage" readonly="true" />
								<form:errors path="percentage"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="previousCollegeName">Previous College Name</form:label>
								<form:input path="previousCollegeName"
									name="previousCollegeName" id="previousCollegeName"
									class="form-control" placeholder="Previous College Name"
									readonly="true" />
								<form:errors path="previousCollegeName"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="subOffExam">Subject Offered for Exam</form:label>
								<form:input path="subOffExam" name="subOffExam" id="subOffExam"
									class="form-control" placeholder="Subject Offered for Exam"
									readonly="true" />
								<form:errors path="subOffExam"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> ADDRESS DETAILS </strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body">
						<div class="row form-group">
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="completeAddress">Address</form:label>
								<form:textarea path="completeAddress" name="completeAddress"
									id="completeAddress" class="form-control"
									placeholder="Type Address" readonly="true" />
								<form:errors path="completeAddress"></form:errors>
							</div>
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="zipcode">Zip Code</form:label>
								<form:input path="zipcode" name="zipcode" id="zipcode"
									class="form-control" placeholder="Zip Code" readonly="true" />
								<form:errors path="zipcode"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> ADMISSION DETAILS
						</strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body">
						<div class="row form-group">
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="doaDD">Date</form:label>
								<form:input path="doaDD" name="doaDD" id="doaDD"
									class="form-control" type="number" placeholder="Date"
									readonly="true" />
								<form:errors path="doaDD"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="doaMonth">Month</form:label>
								<form:input path="doaMonth" name="doaMonth" id="doaMonth"
									class="form-control" placeholder="Month" type="number"
									readonly="true" />
								<form:errors path="doaMonth"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="doaYear">Year</form:label>
								<form:input path="doaYear" name="doaYear" id="doaYear"
									class="form-control" placeholder="Year" readonly="true" />
								<form:errors path="doaYear"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="paidInCollege">Enrollment Fees Date</form:label>
								<form:input path="paidInCollege" name="paidInCollege"
									id="paidInCollege" placeholder="Fees" type="date"
									class="form-control" readonly="true" />
								<form:errors path="paidInCollege"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>