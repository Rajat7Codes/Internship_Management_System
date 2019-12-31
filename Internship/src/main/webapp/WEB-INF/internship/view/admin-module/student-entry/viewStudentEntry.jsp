<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div class="row">
		<div class="col-12">

			<form:form modelAttribute="studentEntry" name="studentEntryForm"
				id="studentEntryForm">

				<div>
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> VIEW STUDENT </strong>
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
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="firstName">
												<strong>First Name</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="firstName" name="firstName" id="firstName"
												class="form-control mb-3" readonly="true" />
											<form:errors path="firstName" class="errors" />
										</div>
									</div>
								</div>


								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="middleName">
												<strong>Middle Name</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="middleName" name="middleName"
												id="middleName" class="form-control" readonly="true" />
											<form:errors path="middleName" class="errors" />
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="lastName">
												<strong>Last Name</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="lastName" name="lastName" id="lastName"
												class="form-control mb-3" readonly="true" />
											<form:errors path="lastName" class="errors" />
										</div>
									</div>
								</div>




								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="college">
												<strong>College</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">

											<input name="collegeName"
												value="${studentEntry.getCollege().collegeName }"
												id="collegeName" class="form-control" readonly="readonly" />

											<%-- <form:select path="college" name="college"
												itemLabel="collegeName" itemValue="collegeId" id="college"
												items="${collegeList}" class="form-control" />
											<form:errors path="internshipSession" class="errors" /> --%>
										</div>
									</div>
								</div>


								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="internshipType">
												<strong>Type</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<input name="type"
												value="${studentEntry.getInternshipType().type }" id="type"
												class="form-control mb-3" readonly="readonly" />

											<%-- <form:select path="internshipType" name="internshipType"
												itemLabel="type" itemValue="internTypeId"
												id="internshipType" items="${internTypeList}"
												class="form-control" />
											<form:errors path="internshipType" class="errors" /> --%>
										</div>
									</div>
								</div>


								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="internshipSession">
												<strong>Session</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<input name="sessionName"
												value="${studentEntry.getInternshipSession().sessionName }"
												id="sessionName" class="form-control" readonly="readonly" />

											<%-- <form:select path="internshipSession"
												name="internshipSession" itemLabel="sessionName"
												itemValue="sessionId" id="internshipSession"
												items="${internSessionList}" class="form-control" />
											<form:errors path="internshipSession" class="errors" /> --%>
										</div>
									</div>
								</div>


								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="internshipDuration">
												<strong>Duration</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<input name="duration"
												value="${studentEntry.getInternshipDuration().duration }"
												id="duration" class="form-control mb-3" readonly="readonly" />


											<%-- 	<form:select path="internshipDuration"
												name="internshipDuration" itemLabel="duration"
												itemValue="internDurId" id="internshipDuration"
												items="${internDurList}" class="form-control" />
											<form:errors path="internshipDuration" class="errors" /> --%>
										</div>
									</div>
								</div>



								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="financialYear">
												<strong>Financial Year</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<input name="year"
												value="${studentEntry.getFinancialYear().year }" id="year"
												class="form-control" readonly="readonly" />

											<%-- <form:select path="financialYear" name="financialYear"
												itemLabel="year" itemValue="financialYearId"
												id="financialYear" items="${fyList}" class="form-control" />
											<form:errors path="financialYear" class="errors" /> --%>
										</div>
									</div>
								</div>



								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="fees">
												<strong>Fees</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="fees" name="fees" id="fees"
												class="form-control mb-3" readonly="true" />
											<form:errors path="fees" class="errors" />
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="discount">
												<strong>Discount</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="discount" name="fees" id="discount"
												class="form-control" readonly="true" />
											<form:errors path="discount" class="errors" />
										</div>
									</div>
								</div>
								<!-- </div> -->


								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="extension">
												<strong>Extension</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="extension" name="fees" id="extension"
												class="form-control" readonly="true" />
											<form:errors path="extension" class="errors" />
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="date">
												<strong>Joining Date</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="date" name="date" id="date"
												class="form-control" readonly="true" />
											<form:errors path="date" class="errors" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</form:form>
		</div>
	</div>
</body>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>


</html>
