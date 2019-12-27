<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<strong class="card-title text-white">ANNOUNCEMENT LIST</strong>
					<a title="Edit" class="btn btn-success"
						style="float: right; margin-right: 10px;margin-top: 2px;"
						href="<c:url value='/admin/announcement/new' />"><i></i>NEW
						ANNOUNCEMENT</a>
				</div>
				<div class="card-body">
					<table id="bootstrap-data-table-export" class="table table-striped">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Number</th>
								<th>Type</th>
								<th>For</th>
								<th>Cr. Date</th>
								<th>Cr. By</th>
								<th>Acad Session</th>
								<th>Acad Year</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="announcement" items="${announcementList}"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${announcement.announcementNumber}</td>
									<td>${announcement.announcementType.type}</td>
									<td>${announcement.announcementFor.annFor}</td>
									<td>${announcement.createdDate}</td>
									<td>${announcement.createdBy}</td>
									<td>${announcement.academicSession.aSession}</td>
									<td>${announcement.academicYear.aYear}</td>
									<td>${announcement.description}</td>
									<td class="valigntop"><div class="btn-group">
											<button
												class="btn btn-xs btn-success dropdown-toggle no-margin"
												type="button" data-toggle="dropdown" aria-expanded="false">
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li><a title="Edit"
													href="<c:url value='/admin/announcement/edit/${announcement.annId }' />"><i
														class="fa fa-edit"></i>Edit</a></li>
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