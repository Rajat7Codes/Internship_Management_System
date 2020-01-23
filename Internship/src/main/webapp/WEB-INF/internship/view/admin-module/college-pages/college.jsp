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
					<strong class="card-title text-white">COLLEGE LIST</strong> <a
						title="Edit" class="btn btn-success"
						style="float: right; margin-right: 10px; margin-top: 2px;"
						href="<c:url value='/admin/college/new' />">NEW COLLEGE</a>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>College Name</th>
								<th>Session</th>
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
									<td>${college.getInternshipSession().sessionName }</td>
									<td>${college.contactNo }</td>
									<td>${college.alternateContactNo }</td>
									<td><c:if test="${college.mouStatus=='true' }">Signed</c:if>
										<c:if test="${college.mouStatus =='false'}">Unsigned</c:if></td>
									<td>${college.tnpHead }</td>
									<td>${college.contactPerson }</td>
									<td style="white-space: nowrap;" class="valigntop">
									<a data-toggle="tooltip" title="Edit"
										href="<c:url value='/admin/college/edit/${college.collegeId }' />"><i
											style="width: 27px; height: 27px;" class="text-center p-2 rounded-circle bg-success fa fa-edit"></i></a>
									<a data-toggle="tooltip" title="View"
										href="<c:url value='/admin/college/view/${college.collegeId }' />"><i
											style="width: 27px; height: 27px;" class="text-center p-2 rounded-circle bg-success fa fa-eye"></i></a>
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