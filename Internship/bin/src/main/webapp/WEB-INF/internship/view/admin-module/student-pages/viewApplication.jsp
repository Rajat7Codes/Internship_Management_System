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

		<form:form modelAttribute="studentApplication"
			name="studentApplicationForm" id="studentApplicationForm">

			<form:hidden path="saId" />
			<form:hidden path="ssoId" value="${user }" />
			<form:hidden path="applicationDate" />
			<form:hidden path="status" />
			<form:hidden path="academicSession" />
			<form:hidden path="studentApplicationDocs" />
			<form:hidden path="ExtraCurricularActs" />

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> STUDENT
							APPLICATION </strong>
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
								<form:label path="course">Course</form:label>
								<form:select path="course" items="${courseList}"
									itemValue="courseId" class="form-control"
									itemLabel="courseName" readonly="true" />
								<form:errors path="course"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="year">Year</form:label>
								<form:select path="year" class="form-control" readonly="true">
									<form:option value="">--SELECT--</form:option>
									<form:option value="1">First Year</form:option>
									<form:option value="2">Second Year</form:option>
									<form:option value="3">Third Year</form:option>
									<form:option value="4">Fourth Year</form:option>
								</form:select>
								<form:errors path="year"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="academicYear">Academic Year</form:label>
								<form:select path="academicYear" items="${academicYearList}"
									itemValue="ayId" class="form-control" itemLabel="aYear"
									readonly="true" />
								<form:errors path="academicYear"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> PERSONAL DETAILS </strong>
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
								<form:label path="firstName">First Name</form:label>
								<form:input path="firstName" name="firstName" id="firstName"
									class="form-control" placeholder="First Name" readonly="true" />
								<form:errors path="firstName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="middleName">Middle Name</form:label>
								<form:input path="middleName" name="middleName" id="middleName"
									class="form-control" placeholder="Middle Name" readonly="true" />
								<form:errors path="middleName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="lastName">Last Name</form:label>
								<form:input path="lastName" name="lastName" id="lastName"
									class="form-control" placeholder="Last Name" readonly="true" />
								<form:errors path="lastName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="fatherName">Father Name</form:label>
								<form:input path="fatherName" name="fatherName" id="fatherName"
									class="form-control" placeholder="Father Name" readonly="true" />
								<form:errors path="fatherName"></form:errors>
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
								<form:label path="gender">Gender</form:label>
								<form:select path="gender" items="${genderList}"
									itemValue="genderId" class="form-control"
									itemLabel="genderName" readonly="true" />
								<form:errors path="gender"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="nationality">Nationality</form:label>
								<form:input path="nationality" name="nationality"
									id="nationality" class="form-control" placeholder="Nationality"
									readonly="true" />
								<form:errors path="nationality"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="category">Category</form:label>
								<%-- <form:input path="category" value="1" /> --%>
								<form:select path="category" class="form-control"
									readonly="true" onchange="showCasteList();">
									<form:option value="">--SELECT--</form:option>
									<form:options items="${categoryList }" itemLabel="categoryName"
										itemValue="categoryId" />
								</form:select>
								<form:errors path="category"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="caste">Caste</form:label>
								<form:input path="caste" class="form-control"
									value="${studentApplication.getCaste().caste }" readonly="true" />
								<form:errors path="caste"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="subcaste">Sub-caste</form:label>
								<form:input path="caste" class="form-control"
									value="${studentApplication.getSubcaste().subcaste }"
									readonly="true" />
								<form:errors path="subcaste"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="uid">UID #</form:label>
								<form:input path="uid" name="uid" id="uid" class="form-control"
									placeholder="UID #" readonly="true" />
								<form:errors path="uid"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> CONTACT DETAILS </strong>
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
								<form:label path="localAddress">Local Address</form:label>
								<form:textarea path="localAddress" name="localAddress"
									id="localAddress" class="form-control"
									placeholder="Enter Local Address" readonly="true" />
								<form:errors path="localAddress"></form:errors>
							</div>
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="permanantAddress">Permanent Address</form:label>
								<form:textarea path="permanantAddress" name="permanantAddress"
									id="permanantAddress" class="form-control"
									placeholder="Enter Permanent Address" readonly="true" />
								<form:errors path="permanantAddress"></form:errors>
							</div>
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="mobileNumber">Mobile #</form:label>
								<form:input path="mobileNumber" name="mobileNumber"
									id="mobileNumber" class="form-control" placeholder="Mobile #"
									readonly="true" />
								<form:errors path="mobileNumber"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="altMobileNumber">Alt Mobile #</form:label>
								<form:input path="altMobileNumber" name="altMobileNumber"
									id="altMobileNumber" class="form-control"
									placeholder="Alt Mobile #" readonly="true" />
								<form:errors path="altMobileNumber"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> CURRICULAR
							ACTIVITIES DETAILS </strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>
					<div class="card-body">
						<div class="row form-group">
							&nbsp;
							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Id #</th>
											<th style="display: none;"></th>
											<th>Category</th>
											<th>Activity</th>
										</tr>
									</thead>
									<tbody id="editCurrActDetBody">
										<c:forEach var="extraCurrAct"
											items="${studentApplication.getExtraCurricularActs() }"
											varStatus="loop">
											<tr>
												<td>${loop.index+1 }</td>
												<td style="display: none;">${extraCurrAct.extCurId }</td>
												<td>${extraCurrAct.category }</td>
												<td>${extraCurrAct.activity }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> PREVIOUS
							EDUCATIONAL DETAILS </strong>
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
								<form:label path="prvStream">Previous Stream</form:label>
								<form:input path="prvStream" name="prvStream" id="prvStream"
									class="form-control" placeholder="Previous Stream"
									readonly="true" />
								<form:errors path="prvStream"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="prvExam">Previous Exam</form:label>
								<form:input path="prvExam" name="prvExam" id="prvExam"
									class="form-control" placeholder="Prevoius Exam"
									readonly="true" />
								<form:errors path="prvExam"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="prvBoard">Previous Board</form:label>
								<form:input path="prvBoard" name="prvBoard" id="prvBoard"
									class="form-control" placeholder="Previous Exam"
									readonly="true" />
								<form:errors path="prvBoard"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="prvPer">Previous Exam Percentage</form:label>
								<form:input path="prvPer" name="prvPer" id="prvPer"
									class="form-control" placeholder="Previous Exam Percentage"
									readonly="true" />
								<form:errors path="prvPer"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> DOCUMENTS DETAILS
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
							&nbsp;
							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Id #</th>
											<th>Document Name</th>
											<th>Description</th>
											<th>Document</th>
										</tr>
									</thead>
									<tbody id="editDocumentBody">
										<c:forEach var="document"
											items="${studentApplication.getStudentApplicationDocs() }"
											varStatus="ind">
											<tr>
												<td>${ind.index+1 }</td>
												<td>${document.documentName }</td>
												<td>${document.description }</td>
												<td>${document.imageName }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> FEES DETAILS </strong>
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
								<form:label path="fees">Fees</form:label>
								<form:input path="fees" name="fees" id="fees"
									class="form-control" placeholder="FEES" readonly="true" />
								<form:errors path="fees"></form:errors>
							</div>
							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="date">Date</form:label>
								<form:input path="date" name="date" id="date"
									class="form-control" type="date" readonly="true" />
								<form:errors path="date"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>

		</form:form>
	</div>

</body>
</html>