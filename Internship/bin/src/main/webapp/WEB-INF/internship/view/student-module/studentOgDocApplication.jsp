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

		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">ORIGINAL DOCUMENTS
						APPLICATION</strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">

					<form:form modelAttribute="studentOgDocApplication"
						name="studentOgDocApplication" id="studentOgDocApplication"
						method="post"
						action="${pageContext.request.contextPath }/student/ogDoc/save">
						<form:hidden path="studentApplication" />
						<%-- <div class="card-body">${errorMessage}</div> --%>
						<div class="card-body">
							<div class="row form-group">
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<form:label path="reason">Reason</form:label>
									<form:textarea path="reason" id="reason" name="reason"
										class="form-control" />
									<form:errors path="reason"></form:errors>
								</div>
								<div class="col-md-6 col-sm-6 col-lg-6 col-12">
									<form:label path="description">Description</form:label>
									<form:textarea path="description" id="description"
										name="description" class="form-control" />
									<form:errors path="description"></form:errors>
								</div>
							</div>

							<div class="col-md-12">
								<div class="row form-group">
									<div
										class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
										<button class="btn btn-danger btn-lg " type="reset">RESET</button>
										<button class="btn btn-success btn-lg" type="submit">SAVE</button>
									</div>
								</div>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>