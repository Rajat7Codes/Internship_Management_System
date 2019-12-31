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
			modelAttribute="fees" name="feesForm" id="feesForm" method="post">

			<form:hidden path="feesId" />

			<div class="col-md-12">
				<div class="card card-topline-darkgreen">
					<div class="card-header card-head pl-4" id="grad">
						<strong class="card-title text-white"> ADD FEES </strong>
						<div class="tools">
							<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
							<a class="t-collapse btn-color fa fa-chevron-down"
								href="javascript:;"></a> <a
								class="t-close btn-color fa fa-times" href="javascript:;"></a>
						</div>
					</div>


					<div class="card-body">
						<div class="row form-group">
							<form:input path="studentEntry" class="form-control"
								value="${studentEntry.studentEntryId }" type="hidden" />

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>First Name</label> <input
									value="${studentEntry.firstName }" name="firstName"
									id="firstName" class="form-control" readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Middle Name</label> <input
									value="${studentEntry.middleName }" name="middleName"
									id="middleName" class="form-control" readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Last Name</label> <input
									value="${studentEntry.lastName }" name="lastName" id="lastName"
									class="form-control" readonly="readonly" />
							</div>
							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>College</label> <input name="collegeName"
									value="${studentEntry.getCollege().collegeName }"
									id="collegeName" class="form-control" readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="studentEntry">Department</form:label>
								<input name="type"
									value="${studentEntry.getDepartment().departmentName }"
									id="type" class="form-control mb-3" readonly="readonly" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="feesAmount">Paid amount</form:label>
								<form:input path="feesAmount" name="feesAmount" id="feesAmount"
									class="form-control" placeholder="fees Amount" />
								<form:errors path="feesAmount"></form:errors>
							</div>


							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="date">Date</form:label>
								<form:input type="date" path="date" name="date" id="date"
									class="form-control" placeholder="date" />
								<form:errors path="date"></form:errors>
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<form:label path="payMode">Payment Mode</form:label>
								<form:select path="payMode" class="form-control" name="payMode"
									id="payMode" onchange="bankSelectCheck(this);">
									<form:options items="${payModeList }"></form:options>
								</form:select>
								<form:errors path="payMode"></form:errors>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- payment mode Bank Details starts -->
			<div id="bankDetails" style="display: none;">
				<div class="col-md-12">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> Bank Details </strong>
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
									<form:label path="bankName">Bank Name</form:label>
									<form:input path="bankName" name="bankName" id="bankName"
										class="form-control" placeholder="Bank Name" />
									<form:errors path="bankName"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="accountNumber">Account#</form:label>
									<form:input path="accountNumber" name="accountNumber"
										id="accountNumber" class="form-control"
										placeholder="Account Number" />
									<form:errors path="accountNumber"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="accountName">Account Name</form:label>
									<form:input path="accountName" name="accountName"
										id="accountName" class="form-control"
										placeholder="Account Name" />
									<form:errors path="accountName"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="ifscCode">Ifsc Code</form:label>
									<form:input path="ifscCode" name="ifscCode" id="ifscCode"
										class="form-control" placeholder="Ifsc Code" />
									<form:errors path="ifscCode"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="branch">Branch</form:label>
									<form:input path="branch" name="branch" id="branch"
										class="form-control" placeholder="branch Name" />
									<form:errors path="branch"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="cheque">Cheque#</form:label>
									<form:input path="cheque" name="cheque" id="cheque"
										class="form-control" placeholder="Cheque Number" />
									<form:errors path="cheque"></form:errors>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="ddDetails" style="display: none;">
				<div class="col-md-12">
					<div class="card card-topline-darkgreen">
						<div class="card-header card-head pl-4" id="grad">
							<strong class="card-title text-white"> DD Details </strong>
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
									<form:label path="ddNumber">DD#</form:label>
									<form:input path="ddNumber" name="ddNumber" id="ddNumber"
										class="form-control" placeholder="DD Number" />
									<form:errors path="ddNumber"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="ddBank">DD Bank</form:label>
									<form:input path="ddBank" name="ddBank" id="ddBank"
										class="form-control" placeholder="DD Bank" />
									<form:errors path="ddBank"></form:errors>
								</div>

								<div class="col-md-4 col-sm-4 col-lg-4 col-12">
									<form:label path="ddDate">Date</form:label>
									<form:input type="date" path="ddDate" name="ddDate" id="ddDate"
										class="form-control" placeholder="DD Date" />
									<form:errors path="ddDate"></form:errors>
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

	<script type="text/javascript">
		function bankSelectCheck(bankSelect) {

			payMode = document.getElementById("payMode").value;
			//alert("payMode ===>" + payMode);

			if (payMode == "Cheque") {
				document.getElementById("bankDetails").style.display = "block";
				document.getElementById("ddDetails").style.display = "none";
				/* document.getElementById("payTitle").style.display = "block"; */
			} else if (payMode == "DD") {
				document.getElementById("ddDetails").style.display = "block";
				document.getElementById("bankDetails").style.display = "none";
			} else if (payMode == "Cash") {
				document.getElementById("ddDetails").style.display = "none";
				document.getElementById("bankDetails").style.display = "none";
			}

		}
	</script>

</body>
</html>