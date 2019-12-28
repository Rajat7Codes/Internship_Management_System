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
		<div class="col-md-4">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">

					<strong class="card-title text-white">ADD COURSE </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">
					<form:form
						action="${pageContext.request.contextPath }/admin/course/save"
						modelAttribute="course" name="courseForm" id="courseForm"
						method="post">

						<form:hidden path="courseId" />

						<div class="row form-group">
							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<form:label path="courseName" class="control-label">Course</form:label>
								<form:input path="courseName" name="courseName" id="courseName"
									class="form-control" placeholder="Enter Course Name" />
								<form:errors path="courseName"></form:errors>
							</div>

							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<form:label path="description">Description</form:label>
								<form:textarea path="description" name="description" rows="1"
									id="description" class="form-control"
									placeholder="Enter Description" />
								<form:errors path="description"></form:errors>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 text-right">
								<button type="reset" class="btn btn-danger">RESET</button>
								<button type="submit" class="btn btn-success">SAVE</button>
							</div>
						</div>
					</form:form>

				</div>
			</div>
		</div>

		<div class="col-md-8">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">FINANCIAL YEAR LIST</strong>
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
								<th>Course</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="course" items="${courseList }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${course.courseName }</td>
									<td>${course.description }</td>
									<td class="valigntop"><div class="btn-group">
											<button
												class="btn btn-xs btn-success dropdown-toggle no-margin"
												type="button" data-toggle="dropdown" aria-expanded="false">
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li><a title="Edit"
													href="<c:url value='/admin/course/edit/${course.courseId }' />"><i
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