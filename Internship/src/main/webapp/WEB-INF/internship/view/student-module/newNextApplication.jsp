<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
label {
	padding-top: 10px;
	font-weight: bold;
}
</style>
</head>
<body>
	<input value="${user }" id="user" type="hidden">
	<input value="${saId }" id="saId" type="hidden">

	<div class="row">
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white"> NEXT YEAR
						APPLICATION </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				&nbsp;
				<div class="card-body">
					<div class="row form-group">
						<div class="col-md-6 col-sm-6 col-lg-6 col-12">
							<select class="form-control" id="previousYear"
								name="previousYear" onchange="showSubList();">
								<option value="">--SELECT PREVIOUS YEAR--</option>
								<option value="1">First Year</option>
								<option value="2">Second Year</option>
								<option value="3">Third Year</option>
								<option value="4">Fourth Year</option>
							</select>
						</div>

						<div class="col-md-6 col-sm-6 col-lg-6 col-12">
							<select class="form-control" id="nextYear" name="nextYear">
								<option value="">--SELECT NEXT YEAR--</option>
								<option value="1">First Year</option>
								<option value="2">Second Year</option>
								<option value="3">Third Year</option>
								<option value="4">Fourth Year</option>
							</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white"> RESULT DETAILS </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">
					<div class="row form-group">
						<div class="col-md-3 col-sm-3 col-lg-3 col-12">
							<label>Sem</label> <input name="sem" id="sem"
								class="form-control" placeholder="Sem" />
						</div>
						<div class="col-md-3 col-sm-3 col-lg-3 col-12">
							<label>Percent</label> <input name="per" id="per"
								class="form-control" placeholder="Percent" />
						</div>
						<div class="col-md-3 col-sm-3 col-lg-3 col-12">
							<label>Out Of</label> <input name="totalOutOf" id="totalOutOf"
								class="form-control" placeholder="Out Of" />
						</div>
						<div class="col-md-3 col-sm-3 col-lg-3 col-12">
							<label>Total Obtained</label> <input name="totalObtained"
								id="totalObtained" class="form-control"
								placeholder="Total Obtained" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white"> SUBJECTS </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				&nbsp;
				<div class="card-body">
					<div class="row form-group">

						<div class="col-md-2 col-sm-2 col-lg-2 col-12">
							<!-- <input name="subject" id="subject" class="form-control"
								placeholder="Subject" /> -->
							<select class="form-control" name="subject" id="subject">
								<option value="">--SELECT--</option>
							</select>
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 col-12">
							<input name="type" id="type" class="form-control"
								placeholder="Type" />
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 col-12">
							<input name="minMarks" id="minMarks" class="form-control"
								placeholder="Min Marks" />
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 col-12">
							<input name="maxMarks" id="maxMarks" class="form-control"
								placeholder="Total Obtained" />
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 col-12">
							<input name="obtainedMarks" id="obtainedMarks"
								class="form-control" placeholder="Obtained Marks" />
						</div>
						<div class="col-md-2 col-sm-2 col-lg-2 col-12" align="center">
							<button class="btn btn-primary btn-md" id="addSubjectRow">ADD</button>
						</div>
						&nbsp;
						<div class="col-md-12 col-sm-12 col-lg-12 col-12">
							<table class="table table-striped" id="subjectTable">
								<thead>
									<tr>
										<th>Action</th>
										<th>Subject</th>
										<th>Type</th>
										<th>Min Marks</th>
										<th>Max Marks</th>
										<th>Obtained Marks</th>
									</tr>
								</thead>
								<tbody id="subjectBody">
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-sm-12 col-lg-12 col-12" align="right">
					<button class="btn btn-secondary btn-md"
						onclick="addSubjectResult();">ADD SEMESTER</button>
				</div>
				&nbsp;
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="row form-group">
				<div class="col-md-12 col-sm-12 col-lg-12 col-12 text-right pl-3 ">
					<form
						action="${pageContext.request.contextPath }/student/application/next/save"
						method="POST">
						<input id="resultData" name="resultData" type="text" />
						<button class="btn btn-success btn-lg" id="grad" type="submit"
							onclick="">SAVE</button>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#addSubjectRow')
								.click(
										function() {
											var subject = document
													.getElementById("subject").value;
											var type = document
													.getElementById("type").value;
											var minMarks = document
													.getElementById("minMarks").value;
											var maxMarks = document
													.getElementById("maxMarks").value;
											var obtainedMarks = document
													.getElementById("obtainedMarks").value;

											var markup = "<tr><td><i class='fa fa-trash' style='color:red;' onclick='deleteRow($(this));'><i></td><td>"
													+ subject
													+ "</td><td>"
													+ type
													+ "</td><td>"
													+ minMarks
													+ "</td><td>"
													+ maxMarks
													+ "</td><td>"
													+ obtainedMarks
													+ "</td></tr>";

											$('#subjectBody').append(markup);
										});
					});
	function deleteRow(row) {
		row.closest('tr').remove();
	}
</script>

<script type="text/javascript">
	var finalObject;
	var subResArray = [];
	function addSubjectResult() {

		var subjectsArray = [];
		var table = document.getElementById("subjectBody");
		for (var j = 0; j < table.rows.length; j++) {

			var subjectsObject = {
				"subject" : table.rows[j].cells[1].innerHTML,
				"type" : table.rows[j].cells[2].innerHTML,
				"minMarks" : table.rows[j].cells[3].innerHTML,
				"maxMarks" : table.rows[j].cells[4].innerHTML,
				"obtainedMarks" : table.rows[j].cells[5].innerHTML
			};
			subjectsArray.push(subjectsObject);
		}

		var resultObject = {
			"sem" : document.getElementById("sem").value,
			"per" : document.getElementById("per").value,
			"totalOutOf" : document.getElementById("totalOutOf").value,
			"totalObtained" : document.getElementById("totalObtained").value,
			"studentAppSemResultDets" : subjectsArray
		};
		subResArray.push(resultObject);

		var nextAppObject = {
			"lastYear" : $("#previousYear").val(),
			"currentYear" : $("#nextYear").val(),
			"studentAppSemResults" : subResArray
		};

		var finalObject = {
			"saId" : $("#saId").val(),
			"studentNextApplications" : nextAppObject
		};

		alert(JSON.stringify(finalObject));

		var data = document.getElementById("resultData");
		data.value = JSON.stringify(finalObject);
	}
</script>

<script type="text/javascript">
	function showSubList() {
		var previousYear = $("#previousYear").val();
		var user = $("#user").val();
		var data = {
			"previousYear" : previousYear,
			"user" : user
		};
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/subject/list",
			async : true,
			data : data,

			success : function(response) {
				$('#subject').empty();
				$.each(response, function(key, value) {
					$('<option>').val(value).text(value).appendTo('#subject');
				});
			}
		});
	}
</script>

</html>