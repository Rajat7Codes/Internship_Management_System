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

.fees-details {
	text-indent: 10px;
	width: 100%;
	/*padding: 10px 0px;*/
	font-size: 20px;
	width: 100%;
}
</style>
</head>
<body>
	<div>
		<form:form
			action="${pageContext.request.contextPath }/admin/fees/return/save"
			modelAttribute="feesReturn" name="feesReturn" id="feesReturn"
			method="post">
			<form:hidden path="feesReturnId" />
			<div class="row">
				<div class="col-4">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> STUDENT </strong>
							<div class="tools">
								<a class="fa fa-repeat btn-color box-refresh"
									href="javascript:;"></a> <a
									class="t-collapse btn-color fa fa-chevron-down"
									href="javascript:;"></a> <a
									class="t-close btn-color fa fa-times" href="javascript:;"></a>
							</div>
						</div>
						<div class="col-md-12">
							<div class="card-body">
								<div class="row form-group">
									<form:input path="studentEntry" class="form-control"
										value="${studentEntry.studentEntryId }" type="hidden" />

									<div class="col-md-12 col-sm-12 col-lg-12 col-12">
										<label>First Name</label> <input
											value="${studentEntry.firstName }" name="firstName"
											id="firstName" class="form-control" readonly="readonly" />
									</div>

									<div class="col-md-12 col-sm-12 col-lg-12 col-12">
										<label>Middle Name</label> <input
											value="${studentEntry.middleName }" name="middleName"
											id="middleName" class="form-control" readonly="readonly" />
									</div>

									<div class="col-md-12 col-sm-12 col-lg-12 col-12">
										<label>Last Name</label> <input
											value="${studentEntry.lastName }" name="lastName"
											id="lastName" class="form-control" readonly="readonly" />
									</div>
									<div class="col-md-12 col-sm-12 col-lg-12 col-12">
										<label>College</label> <input name="collegeName"
											value="${studentEntry.getCollege().collegeName }"
											id="collegeName" class="form-control" readonly="readonly" />
									</div>

									<div class="col-md-12 col-sm-12 col-lg-12 col-12">
										<form:label path="studentEntry">Department</form:label>
										<input name="type"
											value="${studentEntry.getDepartment().departmentName }"
											id="type" class="form-control mb-3" readonly="readonly" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-8">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> RETURN FEES </strong>
							<div class="tools">
								<a class="fa fa-repeat btn-color box-refresh"
									href="javascript:;"></a> <a
									class="t-collapse btn-color fa fa-chevron-down"
									href="javascript:;"></a> <a
									class="t-close btn-color fa fa-times" href="javascript:;"></a>
							</div>
						</div>

						<div class="col-md-12">

							<div class="card-body">
								<div class="row form-group">

									<div class="col-md-6 col-sm-6 col-lg-6 col-12">
										<form:label path="date">Date</form:label>
										<form:input type="date" path="date" name="date" id="date"
											class="form-control" placeholder="date" />
										<form:errors path="date"></form:errors>
									</div>


									<div class="col-md-6 col-sm-6 col-lg-6 col-12">
										<form:label path="reason">Reason </form:label>
										<form:input path="reason" name="reason" id="reason"
											class="form-control" placeholder="Reason" />
										<form:errors path="reason"></form:errors>
									</div>

									<%-- 	<div class="col-md-6 col-sm-6 col-lg-6 col-12">
										<form:label path="studentStatus">Status</form:label>
										<form:select path="studentStatus" class="form-control" name="studentStatus"
											id="studentStatus">
											<form:options items="${statusList}"></form:options>
										</form:select>
										<form:errors path="studentStatus"></form:errors>
									</div> --%>







								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12">
				<div class="row form-group">
					<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
						<button class="btn btn-success btn-lg" id="grad" type="submit">SAVE</button>
					</div>
				</div>
			</div>
		</form:form>
	</div>
</body>


</html>