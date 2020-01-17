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
					<strong class="card-title text-white">ADD INTERNSHIP
						DURATION </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">
					<form:form
						action="${pageContext.request.contextPath }/admin/internship/duration/save"
						modelAttribute="internshipDuration" name="internshipDuration"
						id="internshipDurationForm" method="post">

						<form:hidden path="internDurId" />

						<div class="row form-group">
							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<form:label path="duration">Duration</form:label>
								<form:input path="duration" name="duration" id="duration"
									class="form-control" placeholder="Duration"  required="required" />
								<form:errors path="duration"></form:errors>
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
								<c:if test="${ edit==false }"><button class="btn btn-danger" type="reset">RESET</button></c:if>
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
					<strong class="card-title text-white">INTERNSHIP DURATION
						LIST</strong>
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
								<th>Duration</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="internDurList" items="${internshipDurationList }"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${internDurList.duration }</td>
									<td>${internDurList.description }</td>
									<td class="valigntop"><a data-toggle="tooltip"
										title="Edit"
										href="<c:url value='/admin/internship/duration/edit/${internDurList.internDurId }' />"><i
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