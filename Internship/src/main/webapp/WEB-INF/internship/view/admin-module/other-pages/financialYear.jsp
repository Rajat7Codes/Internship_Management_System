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
					<strong class="card-title text-white">ADD FINANCIAL YEAR </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">
					<form:form
						action="${pageContext.request.contextPath }/admin/financial/year/save"
						modelAttribute="financialYear" name="financialYearForm"
						id="financialYearForm" method="post">

						<form:hidden path="financialYearId" />

						<div class="row form-group">
							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<form:label path="year">Financial Year</form:label>
								<form:input path="year" name="year" id="year"
									class="form-control" placeholder="Financial Year"
									required="required" />
								<form:errors path="year"></form:errors>
							</div>
							<div class="col-md-12 col-sm-12 col-lg-12 col-12">
								<form:label path="active">Status</form:label>
								<form:select path="active" name="active" id="active"  required="required"
									class="form-control">
									<form:option value="true">Active</form:option>
									<form:option value="false">Inactive</form:option>
								</form:select>
								<form:errors path="active"></form:errors>
							</div>
						</div>

						<div class="row form-group">
							<div class="col-md-12 text-right">
								<c:if test="${ edit==false }">
									<button class="btn btn-danger" type="reset">RESET</button>
								</c:if>
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
								<th>Financial Year</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="fy" items="${fyList }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${fy.year }</td>
									<td><c:if test="${fy.active =='true'}">Active</c:if> <c:if
											test="${fy.active =='false'}">Inactive</c:if></td>
									<td class="valigntop" style="white-space: nowrap;"><a data-toggle="tooltip"
										title="Edit"
										href="<c:url value='/admin/financial/year/edit/${fy.financialYearId }' />"><i
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