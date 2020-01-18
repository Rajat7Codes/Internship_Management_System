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

			<form:form
				action="${pageContext.request.contextPath}/admin/college/save"
				modelAttribute="college" name="collegeForm" id="collegeForm">

				<form:hidden path="collegeId" />

				<div>
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> ADD COLLEGE </strong>
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
											<form:label path="collegeName">
												<strong>College Name</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="collegeName" name="collegeName"
												id="collegeName" class="form-control"
												placeholder="Enter College Name" required="required" />
											<form:errors path="collegeName" class="errors" />
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
											<form:select class="form-control" name="internshipSession"
												path="internshipSession" id="internshipSession"
												itemLabel="sessionName" items="${internSessionList }"
												itemValue="sessionId">
											</form:select>
											<form:errors path="internshipSession" class="errors" />
										</div>
									</div>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="contactNo">
												<strong>Contact #</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="contactNo" name="contactNo" id="contactNo"
												class="form-control" placeholder="Enter Contact #"
												required="required" />
											<form:errors path="contactNo" class="errors" />
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="alternateContactNo">
												<strong>Alt. Contact #</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="alternateContactNo"
												name="alternateContactNo" id="alternateContactNo"
												class="form-control" placeholder="Enter Alt. Contact #" />
											<form:errors path="alternateContactNo" class="errors" />
										</div>
									</div>
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="tnpHead">
												<strong>T&amp;P Head</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="tnpHead" name="tnpHead" id="tnpHead"
												class="form-control" placeholder="Enter T&P Head"
												required="required" />
											<form:errors path="tnpHead" class="errors" />
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="mouStatus">
												<strong> Contact Person</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:input path="contactPerson" name="contactPerson"
												id="contactPerson" class="form-control"
												placeholder="Enter Contact Person" />
											<form:errors path="contactPerson" class="errors" />
										</div>
									</div>
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="mouStatus">
												<strong> MOU Status</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:radiobutton path="mouStatus" value="true" />
											Signed
											<form:radiobutton path="mouStatus" value="false" />
											Unsigned
											<form:errors path="mouStatus" class="errors" />
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<div class="row">
										<div class="col-md-4 col-sm-4 col-lg-4 col-12">
											<form:label path="address">
												<strong> Address</strong>
											</form:label>
										</div>
										<div class="col-md-8 col-sm-8 col-lg-8 col-12">
											<form:textarea path="address" name="address" id="address"
												class="form-control" placeholder="Enter Address here"
												required="required" />
											<form:errors path="address" class="errors" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row form-group">
					<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
						<c:if test="${ edit==false }">
							<button class="btn btn-danger btn-lg" type="reset">RESET</button>
						</c:if>
						<button class="btn btn-success btn-lg" id="grad" type="submit">SAVE</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>