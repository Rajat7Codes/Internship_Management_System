<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <div class="row">
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white">SUBJECT </strong>
					<button class="btn btn-success"
						style="float: right; margin-right: 10px;" data-toggle="modal"
						data-target="#smallmodal">ADD SUBJECT</button>
				</div>
				<div class="card-body">

					<c:forEach var="course" items="${courseList }" varStatus="ind">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">${course.courseName }
									<button class="btn btn-success"
										style="float: right; margin-right: 10px;"
										data-toggle="collapse" data-target="#div-${ind.index }">
										<i class="fa fa-eye"></i>
									</button>
								</strong>
							</div>
							<div class="card-body collapse" id="div-${ind.index }">
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Sr.No.</th>
											<th>Year</th>
											<th>Subject</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="subject" items="${course.getSubjects() }"
											varStatus="ind">
											<tr>
												<td>${ind.index+1 }</td>
												<td>${subject.year }</td>
												<td>${subject.subjectName }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>



	<!-- MODAL -->
	<div class="modal fade" id="smallmodal" tabindex="-1" role="dialog"
		aria-labelledby="smallmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" id="modallabel">
					<h5 class="modal-title" id="mediumModalLabel">ADD SUBJECT</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row form-group">
						<div class="col-md-12 col-sm-12 col-12">

							<div class="row form-group">
								<div class="col-md-3 col-sm-3 col-3">
									<select class="form-control" name="courseName" id="courseName">
										<c:forEach var="course" items="${courseList }">
											<option value="${course.courseId }">${course.courseName }</option>
										</c:forEach>
									</select>
								</div>


								<div class="col-md-3 col-sm-3 col-3">
									<select class="form-control" name="year" id="year">
										<option value="">--SELECT--</option>
										<option value="1">First Year</option>
										<option value="2">Second Year</option>
										<option value="3">Third Year</option>
										<option value="4">Fourth Year</option>
									</select>
								</div>

								<div class="col-md-3 col-sm-3 col-3">
									<input type="text" name="subjectName" id="subjectName"
										placeholder="subject" class="form-control" />
								</div>

								<div class="col-md-3 col-sm-3 col-3">
									<button class="btn btn-success btn-block"
										onclick="addSubject();">ADD</button>
								</div>
							</div>
						</div>
					</div>

					<div class="row form-group">
						<div class="col-md-12 col-sm-12 col-12">
							<textarea class="form-control" id="desc" readonly="readonly"></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" onclick="saveData();">Save</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
				</div>

				<form method="post"
					action="${pageContext.request.contextPath }/admin/subject/save/"
					name="subjectForm" id="subjectForm">
					<input type="hidden" name="subjectData" id="subjectData">
				</form>

			</div>
		</div>
	</div> --%>
</body>





<!-- <script type="text/javascript">
	var subjectArray = [];
	var courseName = 0;
	var courseNameArray = [];

	function addSubject() {

		var subjectObject = {
			"year" : document.getElementById("year").value,
			"subjectName" : document.getElementById("subjectName").value
		}
		subjectArray.push(subjectObject);
		courseNameArray.push(document.getElementById("year").value);
		courseNameArray.push(document.getElementById("subjectName").value);

		courseName = document.getElementById("courseName").value;

		document.getElementById("subjectName").value = "";
		document.getElementById("year").value = "";

		document.getElementById("desc").value = courseNameArray;
	}
	function saveData() {

		var subjectObject = {
			"courseId" : courseName,
			"subjects" : subjectArray
		};

		document.getElementById("subjectData").value = JSON
				.stringify(subjectObject);
		document.getElementById("subjectForm").submit();

	}
</script> -->

</html>