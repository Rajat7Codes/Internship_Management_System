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
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white"> SEARCH </strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">
					<div class="text-center p-4">
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								id="dateWiseRadio" onclick="if(this.checked){ searchOption(); }"
								name="search-type"> Date Wise Search
							</label>
						</div>
						<div class="form-check-inline">
							<label class="form-check-label"> <input type="radio"
								id="yearWiseRadio" onclick="if(this.checked){ searchOption()}"
								name="search-type"> Year Wise Search
							</label>
						</div>
					</div>

					<div id="dateSearch" style="display: none;">
						<div class="row form-group">
							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>Start Date</label> <input id="startDate" name="startDate"
									class="form-control" type="date" />
							</div>

							<div class="col-md-4 col-sm-4 col-lg-4 col-12">
								<label>End Date</label> <input id="endDate" name="endDate"
									class="form-control" type="date" />
							</div>
							<div
								class="col-md-4 col-sm-4 col-lg-4 col-12 text-right pl-3 my-auto">
								<button class="btn btn-danger btn-lg" onclick="date_submit()">SEARCH</button>
							</div>
						</div>
					</div>

					<div id="yearSearch" style="display: none;">
						<div class="row form-group">
							<div class="col-md-8 col-sm-8 col-lg-8 col-12">
								<label>Year</label> <select id="year" name="year"
									class="custom-select">
									<option value="">--SELECT YEAR--</option>
									<c:forEach var="fy" items="${financialYearList}"
										varStatus="ind">
										<option value="${fy.year}">${fy.year}</option>
									</c:forEach>
								</select>
							</div>
							<div
								class="col-md-4 col-sm-4 col-lg-4 col-12 text-right pl-3 my-auto">
								<button class="btn btn-danger btn-lg" onclick="year_search()">SEARCH</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-12" id="fees-table">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">FEES MASTER</strong>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="feesSummaryTable"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Name</th>
								<th>College</th>
								<th>Department</th>
								<th>Total Fees</th>
								<th>Discount</th>
								<th>Paid Fees</th>
								<th>Balance Fees</th>
								<th>Fees Amount</th>
								<th>Payment Date</th>
								<th>Payment Mode</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody id="tableBody">

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<script>
	function searchOption() {
		if (document.getElementById('dateWiseRadio').checked) {
			document.getElementById('dateSearch').style.display = 'block';
			document.getElementById('yearSearch').style.display = 'none';
			document.getElementById('year').value = "";
		}
		if (document.getElementById('yearWiseRadio').checked) {
			document.getElementById('dateSearch').style.display = 'none';
			document.getElementById('yearSearch').style.display = 'block';
			document.getElementById('startDate').value = "";
			document.getElementById('endDate').value = "";
		}
	}
</script>

<script>
	function date_submit() {

		data = {
			"startDate" : $("#startDate").val(),
			"endDate" : $("#endDate").val(),
			"year" : $("#year").val()
		};

		$.ajax({
			type : "GET",
			contentType : "application/json",
			url : "/fees/summary/filter",
			data : data,
			dataType : 'json',
			cache : false,
			timeout : 600000,
			success : function(response) {
				alert(JSON.stringify(response));
				var trHTML = '';

				$.each(response, function(i, item) {
					trHTML += '<tr><td>' + "&nbsp;" + (i + 1) + '</td><td>'
							+ "&nbsp;" + +item.studentEntry.firstName
							+ "&nbsp;" + item.studentEntry.middleName
							+ "&nbsp;" + item.studentEntry.lastName + "&nbsp;"
							+ '</td><td>' + "&nbsp;"
							+ item.studentEntry.college.collegeName
							+ '</td><td>' + "&nbsp;"
							+ item.studentEntry.department.departmentName
							+ '</td><td>' + "&nbsp;"
							+ item.studentEntry.feesAmount + '</td><td>'
							+ "&nbsp;" + item.studentEntry.discount
							+ '</td><td>' + "&nbsp;"
							+ item.studentEntry.paidFees + '</td><td>'
							+ "&nbsp;" + item.studentEntry.balanceFees
							+ '</td><td>' + "&nbsp;" + item.feesAmount
							+ '</td><td>' + "&nbsp;" + new Date(item.date)
							+ '</td><td>' + "&nbsp;" + item.payMode
							+ '</td><td>' + "&nbsp;" + item.payStatus
							+ '</td></tr>';
				});

				$('#feesSummaryTable').append(trHTML);
			}
		});
		$("#fees-table").css("display", "block");
	}
</script>

</html>