<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.materialicon {
	margin-top: 22px;
}

.notificationicon {
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="page-bar">
		<div class="page-title-breadcrumb">
			<div class=" pull-left">
				<div class="page-title">Dashboard</div>
			</div>
			<ol class="breadcrumb page-breadcrumb pull-right">
				<li><i class="fa fa-home"></i>&nbsp;<a class="parent-item"
					href="index.html">Home</a>&nbsp;<i class="fa fa-angle-right"></i></li>
				<li class="active">Dashboard</li>
			</ol>
		</div>
	</div>
	<!-- start widget -->
	<div class="state-overview">
		<div class="row">
			<div class="col-xl-3 col-md-6 col-12">
				<div class="info-box bg-b-orange">
					<span class="info-box-icon push-bottom"><i
						class="material-icons materialicon">monetization_on</i></span>
					<div class="info-box-content">
						<span class="info-box-text">Total Income</span> <span
							class="info-box-number"> <c:if
								test="${incomeCount == null }">0</c:if> <c:if
								test="${incomeCount != null }">${incomeCount}</c:if></span>
						<div class="progress">
							<div class="progress-bar" style="width: 45%"></div>
						</div>
						<!-- <span class="progress-description"> 45% Increase in 28 Days
						</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-xl-3 col-md-6 col-12">
				<div class="info-box bg-b-purple">
					<span class="info-box-icon push-bottom"><i
						class="material-icons materialicon">monetization_on</i></span>
					<div class="info-box-content">
						<span class="info-box-text">Total Balance Amount</span> <span
							class="info-box-number"><c:if
								test="${balanceCount == null }">0</c:if> <c:if
								test="${balanceCount != null }">${balanceCount}</c:if></span>
						<div class="progress">
							<div class="progress-bar" style="width: 40%"></div>
						</div>
						<!-- <span class="progress-description"> 40% Increase in 28 Days
						</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-xl-3 col-md-6 col-12">
				<div class="info-box bg-b-cyan">
					<span class="info-box-icon push-bottom"><i
						class="material-icons materialicon">monetization_on</i></span>
					<div class="info-box-content">
						<span class="info-box-text">Total Paid Amount</span> <span
							class="info-box-number"><c:if
								test="${paidAmountCount == null }">0</c:if> <c:if
								test="${paidAmountCount != null }">${paidAmountCount}</c:if></span>
						<div class="progress">
							<div class="progress-bar" style="width: 85%"></div>
						</div>
						<!-- <span class="progress-description"> 85% Increase in 28 Days
						</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
			<div class="col-xl-3 col-md-6 col-12">
				<div class="info-box bg-b-black">
					<span class="info-box-icon push-bottom"><i
						class="material-icons materialicon">monetization_on</i></span>
					<div class="info-box-content">

						<span class="info-box-text">Daily Collection</span> <span
							class="info-box-number"> <c:if
								test="${dailyFeesCollection == null }">
								0
							</c:if> <c:if test="${dailyFeesCollection != null}">
   							${dailyFeesCollection}
							</c:if>
						</span>
						<div class="progress">
							<div class="progress-bar" style="width: 50%"></div>
						</div>
						<!-- <span class="progress-description"> 50% Increase in 28 Days
						</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<!-- /.col -->
		</div>
	</div>
	<!-- end widget -->
	<!-- chart start -->
	<div class="row">
		<div class="col-sm-12">
			<div class="card card-box">
				<div class="card-head">
					<header>Chart Survey</header>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>

				<div class="card-body no-padding height-9">
					<div class="row">
						<div class="card-body ">
							<input placeholder="Search" id="searchInput"
								class="mb-4 float-right">
							<div class="table-wrap">
								<div class="table-responsive">
									<div class="tblHeightSet small-slimscroll-style">
										<table class="table display product-overview mb-30" id="">
											<thead>
												<tr>
													<th>Sr.No.</th>
													<th>Name</th>
													<th>College</th>
													<th>Session</th>
													<th>Duration</th>
													<th>Type</th>
													<th>Fees</th>
													<th>Discount</th>
													<th>Extension</th>
													<th>Joining Date</th>
												</tr>
											</thead>
											<tbody id="tableBody">
												<c:forEach var="stud" items="${studentEntryList }"
													varStatus="ind">
													<tr>
														<td>${ind.index+1 }</td>
														<td>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</td>
														<td>${stud.getCollege().collegeName }</td>
														<td>${stud.getInternshipSession().sessionName }</td>
														<td>${stud.getInternshipDuration().duration }</td>
														<td>${stud.getInternshipType().type }</td>
														<td>${stud.feesAmount }</td>
														<td>${stud.discount }</td>
														<td>${stud.extension }</td>
														<td>${stud.date }</td>
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
			</div>
		</div>
	</div>
</body>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#searchInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#tableBody tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>
</html>