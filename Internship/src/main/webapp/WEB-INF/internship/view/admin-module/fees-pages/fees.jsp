<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<strong class="card-title text-white">STUDENT LIST</strong>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Student_Id</th>
								<th>Name</th>
								<th>College</th>
								<th>Department</th>
								<th>Fees</th>
								<th>Paid_Fees</th>
								<th>Balance_Fees</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="stud" items="${studentEntryList }"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${stud.getCollege().collegeId }</td>
									<td>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</td>
									<td>${stud.getCollege().collegeName }</td>
									<td>${stud.getDepartment().departmentName }</td>
									<td>${stud.feesAmount }</td>
									<td>${stud.paidFees }</td>
									<td>${stud.balanceFees }</td>


									<td class="valigntop"><div class="btn-group">
											<button
												class="btn btn-xs btn-success dropdown-toggle no-margin"
												type="button" data-toggle="dropdown" aria-expanded="false">
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li><a title="Edit"
													href="<c:url value='/admin/fees/receipt/view/${stud.studentEntryId }' />"><i
														class="fa fa-eye"></i>View Receipt</a></li>
												<%-- <li><a title="Edit"
													href="<c:url value='/admin/fees/receipt/print/${stud.studentEntryId }' />"><i
														class="fa fa-edit"></i>Print Receipt</a></li> --%>
												<li><a title="View"
													href="<c:url value='/admin/fees/pay/${stud.studentEntryId }' />"><i
														class="fa fa-rupee"></i>Pay</a></li>
												<%-- <li><a title="Print"
													href="<c:url value='/admin/student/entry/delete/${stud.studentEntryId }' />"><i
														class="fa fa-print"></i>Delete</a></li> --%>
											</ul>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>
</html>