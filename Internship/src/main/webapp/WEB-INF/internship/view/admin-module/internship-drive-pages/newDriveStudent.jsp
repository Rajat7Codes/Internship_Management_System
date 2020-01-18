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
			action="${pageContext.request.contextPath }/admin/internship/drive/student/save"
			modelAttribute="driveStudent" name="driveStudent"
			id="driveStudentForm" method="post">

			<form:hidden path="id" />

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> ADD INTERNSHIP
							DRIVE STUDENT </strong>
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
								<form:label path="studentName">Student Name</form:label>
								<form:input path="studentName" name="studentName"
									id="studentName" class="form-control"
									placeholder="Student Name" />
								<form:errors path="studentName"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="college">College</form:label>
								<form:select class="form-control" name="college" path="college"
									id="college" itemLabel="collegeName" items="${collegeList }"
									itemValue="collegeId">
								</form:select>
								<form:errors path="college" class="errors" />
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="emailId">Email-ID</form:label>
								<form:input path="emailId" name="emailId" id="emailId"
									class="form-control" placeholder="Email ID" />
								<form:errors path="emailId"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-12">
								<form:label path="contactNumber">Contact #</form:label>
								<form:input path="contactNumber" name="contactNumber"
									id="contactNumber" class="form-control" placeholder="Contact #" />
								<form:errors path="contactNumber"></form:errors>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-12">
				<div class="row form-group">
					<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
						<c:if test="${edit==false}">
							<button class="btn btn-danger btn-lg" type="reset">RESET</button>
						</c:if>
						<button class="btn btn-success btn-lg" id="grad" type="submit">SAVE</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>
</html>