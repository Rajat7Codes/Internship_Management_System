<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-md-4">
		<form:form
			action="${pageContext.request.contextPath }/admin/internship/session/save"
			method="post" modelAttribute="session" name="sessionForm"
			id="sessionForm">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">ADD INTERNSHIP
						SESSION </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<form:hidden path="sessionId" />
				<div class="card-body">
					<div class="row form-group">
						<div class="col-sm-12">
							<form:label path="description">Description</form:label>
							<form:input path="description" class="form-control"
								placeholder="Enter description :" />
							<form:errors path="description"></form:errors>
						</div>

						<div class="col-sm-12">
							<form:label path="startDate">Start Date</form:label>
							<form:input type="date" path="startDate" class="form-control"
								placeholder="Enter Start Date :" />
							<form:errors path="startDate"></form:errors>
						</div>

						<div class="col-sm-12">
							<form:label path="endDate">End Date</form:label>
							<form:input type="date" path="endDate" class="form-control"
								placeholder="Enter End Date :" />
							<form:errors path="endDate"></form:errors>
						</div>

						<div class="col-md-12 text-right mt-4">
							<button type="reset" class="btn btn-danger">RESET</button>
							<button type="submit" class="btn btn-success">SAVE</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>
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
				<div class="card">
					<div class="card-body">
						<table id="academictable" class="table table-striped">
							<thead>
								<tr class="text-center">
									<th>Id</th>
									<th>Description</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody id="tBody">
								<c:forEach var="sessions" items="${ sessionList }">
									<tr class="text-center">
										<td>${sessions.sessionId}</td>
										<td>${sessions.description}</td>
										<td>${sessions.startDate}</td>
										<td>${sessions.endDate}</td>
										<td class="valigntop">
											<div class="btn-group">
												<button
													class="btn btn-xs btn-success dropdown-toggle no-margin"
													type="button" data-toggle="dropdown" aria-expanded="false">
													Actions <i class="fa fa-angle-down"></i>
												</button>
												<ul class="dropdown-menu pull-left" role="menu">
													<li><a title="sessionId"
														href="<c:url value='/admin/internship/session/edit/${sessions.sessionId}' />"><i
															class="fa fa-edit"></i>Edit</a></li>
													<li><a title="sessionId"
														href="<c:url value='/admin/internship/session/delete/${sessions.sessionId}' />"><i
															class="fa fa-print"></i>Delete</a></li>
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
		</div>
	</div>
</div>
