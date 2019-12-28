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
					<strong class="card-title text-white">FEEDBACK </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>

				<div class="card-body">
					<form:form
						action="${pageContext.request.contextPath }/student/feedback/save"
						modelAttribute="feedback" name="feedbackForm" id="feedbackForm"
						method="post">

						<%-- <form:hidden path="feedbackId" /> --%>
						
						<div class="row form-group">
							<div class="col-md-12">
								<form:textarea path="description" name="description" id="description"
									class="form-control" placeholder="Enter your feedback " />
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
	</div>
</body>
</html>