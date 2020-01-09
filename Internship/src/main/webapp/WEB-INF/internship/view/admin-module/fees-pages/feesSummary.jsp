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
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white"> SEARCH </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">
					<div class="row form-group">
						<div class="col-md-4 col-sm-4 col-lg-4 col-12">
							<label>Start Date</label> <input class="form-control" type="date" />
						</div>

						<div class="col-md-4 col-sm-4 col-lg-4 col-12">
							<label>End Date</label> <input class="form-control" type="date" />
						</div>
						<div
							class="col-md-4 col-sm-4 col-lg-4 col-12 text-right pl-3 my-auto">
							<button class="btn btn-danger btn-lg " type="reset">SEARCH</button>
						</div>
					</div>
				</div>
			</div>
		</div>
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
								<th>Fees</th>
								<th>Paid Fees</th>
								<th>Balance Fees</th>
								<th>Status</th>
								<th>Fees Amount</th>
								<th>Payment Date</th>
								<th>Payment Mode</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="stud" items="${studentEntryList }" varStatus="ind">
								<c:forEach var="fees" items="${ stud.getFees() }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</td>
									<td>${stud.getCollege().collegeName }</td>
									<td>${stud.getDepartment().departmentName }</td>
									<td>${stud.feesAmount }</td>
									<td>${stud.paidFees }</td>
									<td>${stud.balanceFees }</td>
									<td>${stud.payStatus }</td>
									<td>${fees.feesAmount }</td>
									<td>${fees.date }</td>
									<td>${fees.payMode }</td>
								</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>