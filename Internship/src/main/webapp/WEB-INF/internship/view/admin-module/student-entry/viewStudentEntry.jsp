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
		<form:form modelAttribute="studentEntry" name="studentEntryForm"
			id="studentEntryForm" method="post">

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> VIEW STUDENT </strong>
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
									class="form-control" readonly="true" />
								<form:errors path="firstName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="middleName">Middle Name</form:label>
								<form:input path="middleName" name="middleName" id="middleName"
									class="form-control" readonly="true" />
								<form:errors path="middleName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="lastName">Last Name</form:label>
								<form:input path="lastName" name="lastName" id="lastName"
									class="form-control" readonly="true" />
								<form:errors path="lastName"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>College</label> <input class="form-control"
									name="college" id="college"
									value="${studentEntry.getCollege().collegeName }"
									readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Type</label> <input class="form-control"
									name="internshipType" id="internshipType"
									value="${studentEntry.getInternshipType().type }"
									readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Session</label> <input class="form-control"
									name="internshipSession" id="internshipSession"
									value="${studentEntry.getInternshipSession().sessionName }"
									readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Duration</label> <input class="form-control"
									name="internshipDuration" id="internshipDuration"
									value="${studentEntry.getInternshipDuration().duration }"
									readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Financial Year</label> <input class="form-control"
									name="financialYear" id="financialYear"
									value="${studentEntry.getFinancialYear().year }"
									readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Department</label> <input class="form-control"
									name="financialYear" id="department"
									value="${studentEntry.getDepartment().departmentName }"
									readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="feesAmount">Fees</form:label>
								<form:input path="feesAmount" name="feesAmount" id="feesAmount"
									class="form-control" readonly="true" />
								<form:errors path="feesAmount"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="discount">Discount</form:label>
								<form:input path="discount" name="discount" id="discount"
									class="form-control" readonly="true" />
								<form:errors path="discount"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="extension">Extension</form:label>
								<form:input path="extension" name="extension" id="extension"
									class="form-control" readonly="true" />
								<form:errors path="extension"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="date">Joining Date</form:label>
								<form:input type="date" path="date" name="date" id="date"
									class="form-control" readonly="true" />
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