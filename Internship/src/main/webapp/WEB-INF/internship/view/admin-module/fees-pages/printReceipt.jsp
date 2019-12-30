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
	<div class="col-md-8">
		<div class="card card-topline-darkgreen">
			<div class="card-header  card-head pl-4" id="grad">
				<strong class="card-title text-white"> DEPARTMENT LIST </strong>
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
							<th>Department Name</th>
							<th>Description</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="departmentList" items="${ departmentList }"
							varStatus="ind">
							<tr>
								<td>${ind.index+1 }</td>
								<td>${ departmentList.departmentName }</td>
								<td>${ departmentList.description }</td>
								<td class="valigntop">
									<div class="btn-group">
										<button
											class="btn btn-xs btn-success dropdown-toggle no-margin"
											type="button" data-toggle="dropdown" aria-expanded="false">
											Actions <i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-left" role="menu">
											<li><a title="Edit"
												href="
														<c:url value='/admin/internship/department/edit/${ departmentList.departmentId }' />">
													<i class="fa fa-edit"></i> Edit
											</a></li>
										</ul>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>