<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-circle.btn-xs {
	width: 20px;
	height: 20px;
	padding: 0px 0px;
	border-radius: 50px;
	font-size: 12px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">FEES MASTER</strong>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Name</th>
								<th>College</th>
								<th>Department</th>
								<th>Total Fees</th>
								<th>Paid Fees</th>
								<th>Balance Fees</th>
								<th>Student Status</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="stud" items="${studentEntryList }"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</td>
									<td>${stud.getCollege().collegeName }</td>
									<td>${stud.getDepartment().departmentName }</td>
									<td>${stud.feesAmount }</td>
									<td>${stud.paidFees }</td>

									<td>${stud.balanceFees }</td>
									<td>${stud.studentStatus}</td>
									<td>${stud.payStatus }</td>
									<td style="white-space: nowrap;">
										<a data-toggle="tooltip" title="Receipts" href="<c:url value='/admin/fees/receipt/view/${stud.studentEntryId }' />">
											<i style="width: 27px; height: 27px;" class="text-center p-2 rounded-circle bg-success fa fa-eye">  </i> </a>
											
									
										<a data-toggle="tooltip" title="Pay" href="<c:url value='/admin/fees/pay/${stud.studentEntryId }' />"><i
												style="width: 27px; height: 27px;"
												class="text-center fa fa-rupee p-2 rounded-circle bg-success"></i></a>

										<a data-toggle="tooltip" title="Return" href="<c:url value='/admin/fees/return/${stud.studentEntryId }' />">
												<i style="width: 27px; height: 27px;" class="text-center fa fa-refresh p-2 rounded-circle bg-success"></i>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>