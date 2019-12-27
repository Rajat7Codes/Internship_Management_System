<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">ENROLLMENT
						APPLICATION LIST</strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>

				<div class="card-body">
					<table id="bootstrap-data-table-export" class="table table-striped">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<th>Last Name</th>
								<th>Enrollment #</th>
								<th>Course Name</th>
								<th>Admission Year</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="enroll" items="${enrollAppList }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${enroll.firstName }</td>
									<td>${enroll.fatherName }</td>
									<td>${enroll.surName }</td>
									<td>${enroll.enrollmentNumber }</td>
									<td>${enroll.courseName }</td>
									<td>${enroll.doaYear }</td>
									<td class="valigntop"><div class="btn-group">
											<button
												class="btn btn-xs btn-success dropdown-toggle no-margin"
												type="button" data-toggle="dropdown" aria-expanded="false">
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li><a title="Edit"
													href="<c:url value='/admin/enrollment/application/edit/${enroll.enAppId }' />"><i
														class="fa fa-edit"></i>Edit</a></li>
												<li><a title="View"
													href="<c:url value='/admin/enrollment/application/view/${enroll.enAppId }' />"><i
														class="fa fa-eye"></i>View</a></li>
												<li><a title="Print"
													href="<c:url value='/admin/enrollment/application/print/${enroll.enAppId }' />"><i
														class="fa fa-print"></i>Print</a></li>
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
</html>