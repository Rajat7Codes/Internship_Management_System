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
	<div>
		<form:form
			action="${pageContext.request.contextPath }/admin/student/entry/save"
			modelAttribute="studentEntry" name="studentEntryForm"
			id="studentEntryForm" method="post">

			<form:hidden path="studentEntryId" />

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> ADD STUDENT </strong>
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
								<form:label path="college">College</form:label>
								<form:select class="form-control" name="college" path="college"
									id="college" itemLabel="collegeName" items="${collegeList }"
									itemValue="collegeId">
								</form:select>
								<form:errors path="college" class="errors" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="internshipType">Type</form:label>
								<form:select class="form-control" name="internshipType"
									path="internshipType" id="internshipType" itemLabel="type"
									items="${internTypeList }" itemValue="internTypeId">
								</form:select>
								<form:errors path="internshipType" class="errors" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="internshipSession">Session</form:label>
								<form:select class="form-control" name="internshipSession"
									path="internshipSession" id="internshipSession"
									itemLabel="sessionName" items="${internSessionList }"
									itemValue="sessionId">
								</form:select>
								<form:errors path="internshipSession" class="errors" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="internshipDuration">Duration</form:label>
								<form:select class="form-control" name="internshipDuration"
									path="internshipDuration" id="internshipDuration"
									itemLabel="duration" items="${internDurList }"
									itemValue="internDurId">
								</form:select>
								<form:errors path="internshipDuration" class="errors" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="financialYear">Financial Year</form:label>
								<form:select class="form-control" name="financialYear"
									path="financialYear" id="financialYear" itemLabel="year"
									items="${fyList }" itemValue="financialYearId">
								</form:select>
								<form:errors path="financialYear" class="errors" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="department">Department</form:label>
								<form:select class="form-control" name="financialYear"
									path="department" id="department" itemLabel="departmentName"
									items="${departmentList }" itemValue="departmentId">
								</form:select>
								<form:errors path="department" class="errors" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="feesAmount">Fees</form:label>
								<form:input path="feesAmount" name="feesAmount" id="feesAmount"
									class="form-control" placeholder="Fees Amount" />
								<form:errors path="feesAmount"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="discount">Discount</form:label>
								<form:input path="discount" name="discount" id="discount"
									class="form-control" placeholder="Discount" />
								<form:errors path="discount"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="extension">Extension</form:label>
								<form:input path="extension" name="extension" id="extension"
									class="form-control" placeholder="Extension" />
								<form:errors path="extension"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="date">Joining Date</form:label>
								<form:input type="date" path="date" name="date" id="date"
									class="form-control" />
								<form:errors path="date"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="row form-group">
					<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
						<button class="btn btn-danger btn-lg" type="reset">RESET</button>
						<button class="btn btn-success btn-lg" id="grad" type="submit">SAVE</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>