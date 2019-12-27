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
		<div id="edit" style="display: none;">${edit }</div>
		<div id="studentEdit" style="display: none;">${studentEdit }</div>
		<form:form modelAttribute="studentApplication"
			name="studentApplicationForm" id="studentApplicationForm"
			method="post">

			<form:hidden path="saId" />
			<%-- <form:hidden path="ssoId" value="${user }" /> --%>
			<form:hidden path="ssoId" />
			<form:hidden path="applicationDate" />
			<form:hidden path="academicSession" />
			<form:hidden path="studentApplicationDocs" />
			<form:hidden path="ExtraCurricularActs" />

			<c:if test="${studentEdit=='false' }">
				<form:hidden path="applicationNumber" />
				<form:hidden path="status" />
			</c:if>

			<c:if test="${edit=='true' }">
				<form:hidden path="caste" />
				<form:hidden path="subcaste" />
				<form:hidden path="applicationNumber" />
				<form:hidden path="status" />
			</c:if>

			<%-- 	<c:if test="${edit=='false' }">
				<form:hidden path="ssoId" value="${user}" />
				
			</c:if> --%>

			<c:if test="${studentEdit=='true' }">
				<form:hidden path="caste" />
				<form:hidden path="subcaste" />
			</c:if>

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

							<c:if test="${edit=='true' }">
								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="course">Course</form:label>
									<form:select path="course" items="${courseList}"
										itemValue="courseId" class="form-control"
										itemLabel="courseName" required="true" />
									<form:errors path="course"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="year">Year</form:label>
									<form:select path="year" class="form-control" required="true">
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
										required="true" />
									<form:errors path="academicYear"></form:errors>
								</div>
							</c:if>
							<c:if test="${edit=='false' }">
								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="course">Course</form:label>
									<form:select path="course" items="${courseList}"
										itemValue="courseId" class="form-control"
										itemLabel="courseName" required="true" />
									<form:errors path="course"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="year">Year</form:label>
									<form:select path="year" class="form-control" required="true">
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
										required="true" />
									<form:errors path="academicYear"></form:errors>
								</div>
							</c:if>

							<c:if test="${studentEdit=='true' }">
								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="applicationNumber">Application #</form:label>
									<form:input path="applicationNumber" name="applicationNumber"
										id="applicationNumber" class="form-control" readonly="true" />
									<form:errors path="applicationNumber"></form:errors>
								</div>

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

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="academicSession">Academic Session</form:label>
									<form:select path="academicSession"
										items="${academicSessionList}" itemValue="asId"
										class="form-control" itemLabel="aSession" readonly="true" />
									<form:errors path="academicSession"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="status">Status</form:label>
									<form:input path="status" name="status" id="status"
										class="form-control" readonly="true" />
									<form:errors path="status"></form:errors>
								</div>
							</c:if>
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
									class="form-control" placeholder="First Name" />
								<form:errors path="firstName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="middleName">Middle Name</form:label>
								<form:input path="middleName" name="middleName" id="middleName"
									class="form-control" placeholder="Middle Name" />
								<form:errors path="middleName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="lastName">Last Name</form:label>
								<form:input path="lastName" name="lastName" id="lastName"
									class="form-control" placeholder="Last Name" />
								<form:errors path="lastName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="fatherName">Father Name</form:label>
								<form:input path="fatherName" name="fatherName" id="fatherName"
									class="form-control" placeholder="Father Name" />
								<form:errors path="fatherName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="motherName">Mother Name</form:label>
								<form:input path="motherName" name="motherName" id="motherName"
									class="form-control" placeholder="Mother Name" />
								<form:errors path="motherName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="dob">DOB</form:label>
								<form:input path="dob" name="dob" id="dob" class="form-control"
									type="date" />
								<form:errors path="dob"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="gender">Gender</form:label>
								<form:select path="gender" items="${genderList}"
									itemValue="genderId" class="form-control"
									itemLabel="genderName" required="true" />
								<form:errors path="gender"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="nationality">Nationality</form:label>
								<form:input path="nationality" name="nationality"
									id="nationality" class="form-control" placeholder="Nationality" />
								<form:errors path="nationality"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="category">Category</form:label>
								<%-- <form:input path="category" value="1" /> --%>
								<form:select path="category" id="category" name="category"
									class="form-control" required="true"
									onchange="showCasteList();">
									<form:option value="">--SELECT--</form:option>
									<form:options items="${categoryList }" itemLabel="categoryName"
										itemValue="categoryId" />
								</form:select>
								<form:errors path="category"></form:errors>
							</div>

							<c:if test="${edit=='false' }">
								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="caste">Caste</form:label>
									<form:select path="caste" class="form-control" required="true"
										name="caste" id="caste" onchange="showSubCasteList();">
										<form:option value="">--SELECT--</form:option>
									</form:select>
									<form:errors path="caste"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="subcaste">Sub-caste</form:label>
									<form:select path="subcaste" class="form-control"
										name="subcaste" id="subcaste">
										<form:option value="">--SELECT--</form:option>
									</form:select>
									<form:errors path="subcaste"></form:errors>
								</div>
							</c:if>

							<c:if test="${edit=='true' }">
								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<label>Caste</label> <input id="caste1" name="caste1"
										class="form-control"
										value="${studentApplication.getCaste().caste }"
										readonly="readonly" />
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<label>Sub-caste</label> <input id="subcaste1" name="subcaste1"
										class="form-control"
										value="${studentApplication.getSubcaste().subcaste }"
										readonly="readonly" />
								</div>
							</c:if>

							<c:if test="${studentEdit=='true' }">
								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<label>Caste</label> <input id="caste" name="caste"
										class="form-control"
										value="${studentApplication.getCaste().caste }"
										readonly="readonly" />
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<label>Sub-caste</label> <input id="subcaste" name="subcaste"
										class="form-control"
										value="${studentApplication.getSubcaste().subcaste }"
										readonly="readonly" />
								</div>
							</c:if>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="uid">UID #</form:label>
								<form:input path="uid" name="uid" id="uid" class="form-control"
									placeholder="UID #" />
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
									placeholder="Enter Local Address" />
								<form:errors path="localAddress"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="permanantAddress">Permanent Address</form:label>
								<form:textarea path="permanantAddress" name="permanantAddress"
									id="permanantAddress" class="form-control"
									placeholder="Enter Permanent Address" />
								<form:errors path="permanantAddress"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="mobileNumber">Mobile #</form:label>
								<form:input path="mobileNumber" name="mobileNumber"
									id="mobileNumber" class="form-control" placeholder="Mobile #" />
								<form:errors path="mobileNumber"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="altMobileNumber">Alt Mobile #</form:label>
								<form:input path="altMobileNumber" name="altMobileNumber"
									id="altMobileNumber" class="form-control"
									placeholder="Alt Mobile #" />
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
							<c:if test="${edit=='false' }">
								<div class="col-md-5 col-sm-5 col-lg-5 col-12">
									<input name="currCategory" id="currCategory"
										class="form-control" placeholder="Sport" />
								</div>
								<div class="col-md-5 col-sm-5 col-lg-5 col-12">
									<input name="activity" id="activity" class="form-control"
										placeholder="Activity" />
								</div>
								<div class="col-md-1 col-sm-1 col-lg-1 col-12"></div>
								<c:if test="${edit=='false' }">
									<div class="col-md-1 col-sm-1 col-lg-1 col-12">
										<a class="btn btn-primary btn-md" id="currActDetRow">ADD</a>
									</div>
								</c:if>
								<c:if test="${edit=='true' }">
									<div class="col-md-1 col-sm-1 col-lg-1 col-12">
										<a class="btn btn-primary btn-md" id="editCurrActDetRow">ADD</a>
									</div>
								</c:if>
								&nbsp;
								<div class="col-md-12 col-sm-12 col-lg-12 col-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Action</th>
												<th>Category</th>
												<th>Activity</th>
											</tr>
										</thead>
										<tbody id="currActDetBody">
										</tbody>
									</table>
								</div>
							</c:if>

							<c:if test="${edit=='true' }">
								<div class="col-md-12 col-sm-12 col-lg-12 col-12">
									&nbsp;
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id #</th>
												<th style="display: none;"></th>
												<th>Category</th>
												<th>Activity</th>
											</tr>
										</thead>
										<tbody>
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
							</c:if>

							<c:if test="${studentEdit=='true' }">
								<div class="col-md-12 col-sm-12 col-lg-12 col-12">
									&nbsp;
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id #</th>
												<th style="display: none;"></th>
												<th>Category</th>
												<th>Activity</th>
											</tr>
										</thead>
										<tbody>
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
							</c:if>

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
									class="form-control" placeholder="Previous Stream" />
								<form:errors path="prvStream"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="prvExam">Previous Exam</form:label>
								<form:input path="prvExam" name="prvExam" id="prvExam"
									class="form-control" placeholder="Prevoius Exam" />
								<form:errors path="prvExam"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="prvBoard">Previous Board</form:label>
								<form:input path="prvBoard" name="prvBoard" id="prvBoard"
									class="form-control" placeholder="Previous Exam" />
								<form:errors path="prvBoard"></form:errors>
							</div>
							<div class="col-md-3 col-sm-3 col-lg-3 col-12">
								<form:label path="prvPer">Previous Exam Percentage</form:label>
								<form:input path="prvPer" name="prvPer" id="prvPer"
									class="form-control" placeholder="Previous Exam Percentage" />
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
							<c:if test="${edit=='false' }">
								<div class="col-md-3 col-sm-3 col-lg-3 col-12">
									<select name="documentName" id="documentName"
										class="form-control">
										<option value="">--SELECT--</option>
										<option value="SSC">SSC Passing Cert.</option>
										<option value="HSC">HSC Passing Cert.</option>
										<option value="LC">LC / TC</option>
										<option value="CC">Caste Certificate</option>
										<option value="CVC">Caste Validity Certificate</option>
										<option value="PSP">Passport Size Photo</option>
										<option value="UID">Aadhar Card (UID)</option>
										<option value="BP">Bank Passbook</option>
									</select>
								</div>

								<div class="col-md-5 col-sm-5 col-lg-5 col-12">
									<input name="description" id="description" class="form-control"
										placeholder="Enter Description" />
								</div>

								<div class="col-md-3 col-sm-3 col-lg-3 col-12">
									<input name="file" id="imageName" class="form-control dummy"
										type="file" />
								</div>

								<div class="col-md-1 col-sm-1 col-lg-1 col-12">
									<a class="btn btn-primary btn-md" id="documentDetRow"
										onclick="uploadImage();">ADD</a>
								</div>
								&nbsp;
								<div class="col-md-12 col-sm-12 col-lg-12 col-12">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Document Name</th>
												<th>Description</th>
												<th>Document</th>
											</tr>
										</thead>
										<tbody id="documentBody">
										</tbody>
									</table>
								</div>
							</c:if>
							<c:if test="${edit=='true' }">
								<div class="col-md-12 col-sm-12 col-lg-12 col-12">
									&nbsp;
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id #</th>
												<th style="display: none;"></th>
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
													<td style="display: none;">${document.spDocId }</td>
													<td>${document.documentName }</td>
													<td>${document.description }</td>
													<td>${document.imageName }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
							<c:if test="${studentEdit=='true' }">
								<div class="col-md-12 col-sm-12 col-lg-12 col-12">
									&nbsp;
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Id #</th>
												<th style="display: none;"></th>
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
													<td style="display: none;">${document.spDocId }</td>
													<td>${document.documentName }</td>
													<td>${document.description }</td>
													<td>${document.imageName }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>

			<c:if test="${edit=='true' }">
				<div class="col-md-12">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> FEES DETAILS </strong>
							<div class="tools">
								<a class="fa fa-repeat btn-color box-refresh"
									href="javascript:;"></a> <a
									class="t-collapse btn-color fa fa-chevron-down"
									href="javascript:;"></a> <a
									class="t-close btn-color fa fa-times" href="javascript:;"></a>
							</div>
						</div>
						<div class="card-body">
							<div class="row form-group">
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<form:label path="fees">Fees</form:label>
									<form:input path="fees" name="fees" id="fees"
										class="form-control" placeholder="FEES" />
									<form:errors path="fees"></form:errors>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<form:label path="date">Date</form:label>
									<form:input path="date" name="date" id="date"
										class="form-control" type="date" />
									<form:errors path="date"></form:errors>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<c:if test="${studentEdit=='true' }">
				<div class="col-md-12">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> FEES DETAILS </strong>
							<div class="tools">
								<a class="fa fa-repeat btn-color box-refresh"
									href="javascript:;"></a> <a
									class="t-collapse btn-color fa fa-chevron-down"
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
			</c:if>

			<input name="extCurActData" id="extCurActData" type="hidden" />
			<input name="documentDetData" id="documentDetData" type="hidden" />

			<div class="col-md-12">
				<div class="row form-group">
					<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
						<button class="btn btn-danger btn-lg " type="reset">RESET</button>
						<c:if test="${edit=='false' }">
							<button class="btn btn-success btn-lg" id="grad" type="submit"
								onclick="getJson(); submitForm();">SAVE</button>
						</c:if>
						<c:if test="${edit=='true' }">
							<button class="btn btn-success btn-lg" id="grad" type="submit"
								onclick="submitForm();">UPDATE</button>
						</c:if>
						<c:if test="${studentEdit=='true' }">
							<button class="btn btn-success btn-lg" id="grad" type="submit"
								onclick="submitForm();">UPDATE</button>
						</c:if>
					</div>
				</div>
			</div>
		</form:form>

	</div>

</body>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>

<script type="text/javascript">
	function submitForm() {
		var edit = document.getElementById("edit").innerHTML;
		var studentEdit = document.getElementById("studentEdit").innerHTML;

		if (edit == "true") {
			var form = document.getElementById("studentApplicationForm");
			form
					.setAttribute("action",
							"${pageContext.request.contextPath}/admin/application/save");
			form.submit();
		} else if (edit == "false") {
			var form = document.getElementById("studentApplicationForm");
			form
					.setAttribute("action",
							"${pageContext.request.contextPath}/student/application/save");
			form.submit();
		} else if (studentEdit == "true") {
			var form = document.getElementById("studentApplicationForm");
			form
					.setAttribute("action",
							"${pageContext.request.contextPath}/student/application/save");
			form.submit();
		}
	}
</script>

<script type="text/javascript">
	function showCasteList() {
		var categoryId = $("#category").val();
		var data = {
			"categoryId" : categoryId
		};
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/caste/list",
			async : true,
			data : data,
			success : function(response) {

				$('#caste').empty();
				$('<option>').val("").text("--SELECT--").appendTo('#caste');
				$.each(response, function(index) {
					$('<option>').val(response[index].casteId).text(
							response[index].caste).appendTo('#caste');
				});

			},
			error : function() {
				alert(error);
			}
		});
	}

	function showSubCasteList() {
		var casteId = $("#caste").val();
		var data = {
			"casteId" : casteId
		};
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/subcaste/list",
			async : true,
			data : data,
			success : function(response) {
				$('#subcaste').empty();
				$('<option>').val("").text("--SELECT--").appendTo('#subcaste');
				$.each(response, function(index) {
					$('<option>').val(response[index].subcasteId).text(
							response[index].subcaste).appendTo('#subcaste');
				});
			}
		});
	}

	$(document)
			.ready(
					function() {
						$('#currActDetRow')
								.click(
										function() {

											var currCategory = document
													.getElementById("currCategory").value;
											var activity = document
													.getElementById("activity").value;

											var markup = "<tr><td><i class='fa fa-trash' style='color:red;' onclick='deleteRow($(this));'><i></td><td>"
													+ currCategory
													+ "</td><td>"
													+ activity
													+ "</td></tr>";

											$('#currActDetBody').append(markup);
										});
					});
	function deleteRow(row) {
		row.closest('tr').remove();
	}

	function uploadImage() {
		var edit = document.getElementById("edit").innerHTML;

		var name = '${user}' + Math.floor(Date.now() / 1000);
		var documentData = new FormData();
		const fname = $('input[type=file]')[0].files[0].name;
		const lastDot = fname.lastIndexOf('.');
		const ext = fname.substring(lastDot + 1);
		documentData.append("file", $('input[type=file]')[0].files[0], name
				+ "." + ext);
		$
				.ajax({
					url : '${pageContext.request.contextPath}/upload/file',
					type : 'POST',
					data : documentData,
					enctype : 'multipart/form-data',
					cache : false,
					contentType : false,
					processData : false,
					success : function(response) {

						alert("Document uploaded successfully.");
						var documentName = document
								.getElementById("documentName").value;
						var description = document
								.getElementById("description").value;
						var markup = "<tr><td>" + documentName + "</td><td>"
								+ description + "</td><td>" + name + "." + ext
								+ "</td></tr>";
						$('#documentBody').append(markup);
					},
					error : function(error) {
						alert("Error Occured " + JSON.stringify(error));
					}
				});
	}

	function getJson() {
		var extCurActArray = [];
		var documentDetArray = [];
		var documentTable = document.getElementById("documentBody");
		var extCurActTable = document.getElementById("currActDetBody");

		for (var i = 0; i < documentTable.rows.length; i++) {
			var jsonObject = {
				"documentName" : documentTable.rows[i].cells[0].innerHTML,
				"imageName" : documentTable.rows[i].cells[2].innerHTML,
				"description" : documentTable.rows[i].cells[1].innerHTML,
				"uploaded" : true
			};
			documentDetArray.push(jsonObject);
		}

		for (var i = 0; i < extCurActTable.rows.length; i++) {
			var jsonObject = {
				"category" : extCurActTable.rows[i].cells[1].innerHTML,
				"activity" : extCurActTable.rows[i].cells[2].innerHTML
			};
			extCurActArray.push(jsonObject);
		}

		//alert(JSON.stringify(extCurActArray));
		//alert(JSON.stringify(documentDetArray));
		$("#extCurActData").val(JSON.stringify(extCurActArray));
		$("#documentDetData").val(JSON.stringify(documentDetArray));
	}
</script>


</html>