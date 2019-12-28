<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="row">
	<div class="col-md-4">
		<form:form action="${pageContext.request.contextPath }/admin/internship/session/add"
			method="post" modelAttribute="session" name="sessionForm" id="sessionForm">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4 text-center" id="grad">
					<strong class="card-title text-white"> ${edit} SESSION </strong>
				</div>
				<form:hidden path="sessionId" />
				<div class="card-body">
					<div class="row form-group">
						<div class="col-sm-12">
							<form:label path="description">Description</form:label>
							<form:input path="description" class="form-control"
								placeholder="Enter description :" 
								<c:if test="${edit==\"UPDATE\"}">
								 value="${session.getSessionId()}"
								</c:if> />
							<form:errors path="description"></form:errors>
						</div>

						<div class="col-sm-12">
							<form:label path="startDate">Start Date</form:label>
							<form:input type="date" path="startDate" class="form-control"
								placeholder="Enter Start Date :" />
								<!--<c:if test="${edit==\"UPDATE\"}">
								 value="${session.getStartDate()}"
								</c:if> -->
							<form:errors path="startDate"></form:errors>
						</div>

						<div class="col-sm-12">
							<form:label path="endDate">End Date</form:label>
							<form:input type="date" path="endDate" class="form-control"
								placeholder="Enter End Date :" />
								<!--<c:if test="${edit==\"UPDATE\"}">
								 value="${session.getEndDate()}"
								</c:if> -->
							<form:errors path="endDate"></form:errors>
						</div>
						
						<c:if test="${edit==\"ADD\"}">
						<div class="col-sm-12 text-right mt-4 text-center">
							<button class="btn btn-success btn-lg" type="submit">SUBMIT SESSION</button>
						</div>
						</c:if>
						<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  --> 
					</div>
				</div>
			</div>
		</form:form>
	</div>
	
	<div class="col-md-8">
		<div class="card card-topline-darkgreen">
			<div class="card-header card-head pl-4 text-center" id="grad">
				<strong class="card-title text-white"> ALL SESSION DETAILS </strong>
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
									<td> ${sessions.getSessionId()} </td>	
									<td> ${sessions.getDescription()} </td>	
									<td> ${sessions.getStartDate()} </td>	
									<td> ${sessions.getEndDate()} </td>	
									<td class="valigntop">
										<div class="btn-group">
											<button class="btn btn-xs btn-success dropdown-toggle no-margin" type="button" data-toggle="dropdown" aria-expanded="false">
												Actions <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-left" role="menu">
												<li>
													<a title="Edit" href="<c:url value='/admin/internship/session/edit/${sessions.getSessionId()}' />"><i
														class="fa fa-edit"></i>Edit</a></li>
												<%-- <li><a title="View"
													href="<c:url value='/admin/application/view/${app.saId }' />"><i
														class="fa fa-eye"></i>View</a></li> --%>
												<li><a title="Print"
													href="<c:url value='/admin/internship/session/delete/${sessions.getSessionId()}' />"><i
														class="fa fa-print"></i>Delete</a></li>
											</ul>
										</div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${edit==\"UPDATE\"}">
						<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right mt-4 text-center">
							<button class="btn btn-success btn-lg" onclick="getJson()"
								type="submit">UPDATE STUDENT</button>
						</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
