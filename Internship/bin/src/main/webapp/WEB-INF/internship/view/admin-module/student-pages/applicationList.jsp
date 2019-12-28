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
					<strong class="card-title text-white">APPLICATION LIST</strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Application #</th>
								<th>Acad Year</th>
								<th>Student Name</th>
								<th>DOB</th>
								<th>Mobile #</th>
								<th>Date</th>
								<th colspan="2">Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="app" items="${studAppList }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${app.applicationNumber }</td>
									<td>${app.getAcademicYear().aYear }</td>
									<td>${app.firstName }&nbsp;${app.middleName }&nbsp;${app.lastName }</td>
									<td>${app.dob }</td>
									<td>${app.mobileNumber }</td>
									<td>${app.applicationDate }</td>
									<td><form:form
											action="${pageContext.request.contextPath}/admin/student/application/accept/${app.saId }"
											modelAttribute="studentApplication" id="acceptForm"
											method="post">
											<button class="btn btn-success btn-circle btn-xs"
												id="${app.saId}" type="submit">
												<i class="fa fa-check"></i>
											</button>
										</form:form></td>
									<td><form:form
											action="${pageContext.request.contextPath}/admin/student/application/reject/${app.saId}"
											modelAttribute="studentApplication" id="rejectForm"
											method="post">
											<button class="btn btn-danger btn-circle btn-xs"
												id="${app.saId}" type="submit">
												<i class="fa fa-ban"></i>
											</button>
										</form:form></td>
									

									<td class="valigntop"><div class="btn-group">
											<button
												class="btn btn-xs btn-success dropdown-toggle no-margin"
												type="button" data-toggle="dropdown" aria-expanded="false" >
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li><a title="Edit"
													href="<c:url value='/admin/application/edit/${app.saId }' />"><i
														class="fa fa-edit"></i>Edit</a></li>
												<li><a title="View"
													href="<c:url value='/admin/application/view/${app.saId }' />"><i
														class="fa fa-eye"></i>View</a></li>
												<li><a title="Print"
													href="<c:url value='/admin/application/print/${app.saId }' />"><i
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


<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
	$('#acceptForm').submit(function() {

		alert("Enter in Accept ajax");

		var form = this;
		$.ajax({
			type : form.attr('method'), // method attribute of form
			url : form.attr('action'), // action attribute of form
			success : function(result) {
				alert("Admitted successfully");
			},
			error : function() {
				alert("Error Occured While accepting application");
			}
		});
	});
	
	$('#rejectForm').submit(function() {

		alert("Enter in Accept ajax");

		var form = this;
		$.ajax({
			type : form.attr('method'), // method attribute of form
			url : form.attr('action'), // action attribute of form
			success : function(result) {
				alert("Admission rejected successfully");
			},
			error : function() {
				alert("Error Occured While rejecting application");
			}
		});
	});
	
</script>


</html>