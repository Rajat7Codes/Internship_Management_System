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
					<strong class="card-title text-white">INTERNSHIP DRIVE
						STUDENT LIST</strong> <a title="Edit" class="btn btn-success"
						style="float: right; margin-right: 10px; margin-top: 2px;"
						href="<c:url value='/admin/internship/drive/student/new' />">NEW
						STUDENT </a>
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
								<th>Email-ID</th>
								<th>Contact #</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="stud" items="${driveStudentList }"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${stud.studentName }</td>
									<td>${stud.college }</td>
									<td>${stud.emailId}</td>
									<td>${stud.contactNumber }</td>
									<td class="valigntop"><a data-toggle="tooltip"
										title="Edit"
										href="<c:url value='/admin/internship/drive/student/edit/${stud.id }' />"><i
											style="width: 27px; height: 27px;"
											class="text-center p-2 rounded-circle bg-success fa fa-edit"></i></a>
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