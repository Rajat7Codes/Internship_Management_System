
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-circle.btn-xs {
	width: 20px;
	height: 20px;
	padding: 0px 0px;
	border-radius: 50px;
	font-size: 12px;
	text-align: center;
}
</style>
</head>
<body>
	<div class="row">
		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header  card-head pl-4" id="grad">
					<strong class="card-title text-white">RECIEPT LIST</strong>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Reciept_Id</th>
								<th>Fees_Amount</th>
								<th>Date</th>
								<th>Pay_Mode</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="fees" items="${studentEntry.fees }"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${fees.feesId }</td>
									<td>${fees.feesAmount }</td>
									<td>${fees.date }</td>
									<td>${fees.payMode }</td>

									<td class="valigntop" style="white-space: nowrap;"><a data-toggle="tooltip"
										title="Print"
										href="<c:url value='/admin/fees/receipt/print/${fees.feesId }' />">
											<i
											class="text-center p-2 rounded-circle bg-success fa fa-print"
											aria-hidden="true"></i>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>

<script
	src="${pageContext.request.contextPath }/static/plugins/jquery/jquery.min.js"></script>
</html>