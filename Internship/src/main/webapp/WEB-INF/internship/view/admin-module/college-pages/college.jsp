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
								<th>Contact No</th>
								<th>Alternative Contact No</th>
								<th>MOU Status</th>
								<th>>TNP Head</th>
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
									<td><a
										href="${pageContext.request.contextPath}/admin/college/delete/${college.id}">
											<i class="material-icons">&#xE872;</i>
									</a> <a
										href="${pageContext.request.contextPath}/admin/college/update/${college.id}">
											<i class="material-icons">&#xE254;</i>
									</a></td>



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