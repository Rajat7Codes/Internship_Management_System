<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<!--
  @author Puja
  @version 0.1
  Creation Date: 27/12/2019
 -->


<body>
	<div class="row">
		<div class="col-12">

			<form:form
				action="${pageContext.request.contextPath}/admin/college/save"
				modelAttribute="college" name="collegeForm" id="collegeForm">
				<form:hidden path="id" />
				<div>
					<div class="card card-topli
				ne-darkgreen">
						<div class="card-header card-head pl-12" id="grad">
							<strong class="card-title text-white">${edit} College</strong>
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

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="collegeName">College Name</form:label>
									<form:input path="collegeName" class="form-control" />
									<form:errors path="collegeName"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="contactNo">Contact No </form:label>
									<form:input path="contactNo" class="form-control" />
									<form:errors path="contactNo"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="alternateContactNo">Alternative Contact No</form:label>
									<form:input path="alternateContactNo" class="form-control" />
									<form:errors path="alternateContactNo"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="mouStatus">MOU Status</form:label>

									<form:input path="mouStatus" class="form-control" type="radio"
										name="mouStatus" value="true" />
									<form:input path="mouStatus" class="form-control" type="radio"
										name="mouStatus" value="false" />
									<form:errors path="mouStatus"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="tnpHead">TNP Head</form:label>
									<form:input path="tnpHead" class="form-control" />
									<form:errors path="tnpHead"></form:errors>
								</div>


								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="contactPerson">Contact Person</form:label>
									<form:input path="contactPerson" class="form-control" />
									<form:errors path="contactPerson"></form:errors>
								</div>

							</div>
						</div>
					</div>
				</div>
				<div>
					<div class="row form-group">
						<div
							class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-12  text-center">
							<button class="btn btn-success btn-lg " id="grad" type="submit">SAVE</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
