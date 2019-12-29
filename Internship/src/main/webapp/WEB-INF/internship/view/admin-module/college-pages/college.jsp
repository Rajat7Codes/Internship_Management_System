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

					<strong class="card-title text-white">COLLEGE INFORMATION
						LIST</strong> <a title="Edit" class="btn btn-success"
						style="float: right; margin-right: 10px; margin-top: 2px;"
						href="<c:url value='/admin/college/new' />"><i></i>ADD COLLEGE</a>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>College Name</th>
								<th>Contact #</th>
								<th>Alt. Contact #</th>
								<th>MOU Status</th>
								<th>TNP Head</th>
								<th>Contact Person</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="college" items="${collegeList }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${college.collegeName }</td>
									<td>${college.contactNo }</td>
									<td>${college.alternateContactNo }</td>
									<td>${college.mouStatus }</td>
									<td>${college.tnpHead }</td>
									<td>${college.contactPerson }</td>
									<td class="valigntop"><div class="btn-group">
											<button
												class="btn btn-xs btn-success dropdown-toggle no-margin"
												type="button" data-toggle="dropdown" aria-expanded="false">
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li><a title="Edit"
													href="<c:url value='/admin/college/edit/${college.collegeId }' />"><i
														class="fa fa-edit"></i>Edit</a></li>
												<li><a title="View"
													href="<c:url value='/admin/college/view/${college.collegeId }' />"><i
														class="fa fa-eye"></i>View</a></li>
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