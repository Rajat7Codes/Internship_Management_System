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
			action="${pageContext.request.contextPath }/admin/fees/save"
			modelAttribute="fees" name="fees" id="fees" method="post">

			<form:hidden path="feesId" />

			<div class="row">
				<div class="col-4">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> ADD FEES </strong>
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
							<strong class="card-title text-white"> ADD FEES </strong>
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
										<form:label path="feesAmount">Paid amount</form:label>
										<form:input path="feesAmount" name="feesAmount"
											id="feesAmount" class="form-control"
											placeholder="Fees Amount" />
										<form:errors path="feesAmount"></form:errors>
									</div>

									<div class="col-md-6 col-sm-6 col-lg-6 col-12">
										<form:label path="date">Date</form:label>
										<form:input type="date" path="date" name="date" id="date"
											class="form-control" placeholder="date" />
										<form:errors path="date"></form:errors>
									</div>

									<div class="col-md-6 col-sm-6 col-lg-6 col-12">
										<form:label path="payMode">Payment Mode</form:label>
										<form:select path="payMode" class="form-control"
											name="payMode" id="payMode" onchange="bankSelectCheck(this);">
											<form:options items="${payModeList }"></form:options>
										</form:select>
										<form:errors path="payMode"></form:errors>
									</div>

									<div class="col-md-6 col-sm-6 col-lg-6 col-12" id="num"
										style="display: none;">
										<form:label path="payModeDate">
											<span id="chequeNumber" style="display: none;">Cheque
												#</span>
											<span id="ddNumber" style="display: none;">DD #</span>
										</form:label>
										<form:input path="payModeDate" name="payModeDate"
											id="payModeDate" class="form-control"
											placeholder="Enter Number" />
										<form:errors path="payModeDate"></form:errors>
									</div>

									<div class="col-md-6 col-sm-6 col-lg-6 col-12" id="date1"
										style="display: none;">
										<form:label path="num">
											<span id="chequeDate" style="display: none;">Cheque
												Date</span>
											<span id="ddDate" style="display: none;">DD Date</span>
										</form:label>
										<form:input path="num" type="date" name="num" id="num"
											class="form-control" />
										<form:errors path="num"></form:errors>
									</div>

								</div>
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

<script type="text/javascript">
	function bankSelectCheck(bankSelect) {
		payMode = document.getElementById("payMode").value;

		if (payMode == "Cash") {
			document.getElementById("chequeNumber").style.display = "none";
			document.getElementById("ddNumber").style.display = "none";
			document.getElementById("chequeDate").style.display = "none";
			document.getElementById("ddDate").style.display = "none";
			document.getElementById("num").style.display = "none";
			document.getElementById("date1").style.display = "none";

		} else if (payMode == "DD") {
			document.getElementById("num").style.display = "block";
			document.getElementById("date1").style.display = "block";
			document.getElementById("chequeNumber").style.display = "none";
			document.getElementById("ddNumber").style.display = "block";
			document.getElementById("chequeDate").style.display = "none";
			document.getElementById("ddDate").style.display = "block";

		} else if (payMode == "Cheque") {
			document.getElementById("num").style.display = "block";
			document.getElementById("date1").style.display = "block";
			document.getElementById("chequeNumber").style.display = "block";
			document.getElementById("ddNumber").style.display = "none";
			document.getElementById("chequeDate").style.display = "block";
			document.getElementById("ddDate").style.display = "none";
		}
	}
</script>

</html>