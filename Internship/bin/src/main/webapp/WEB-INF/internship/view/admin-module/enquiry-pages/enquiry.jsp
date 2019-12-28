<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<strong class="card-title text-white">ENQUIRY LIST </strong>
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
								<th>Subject</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="enquiry" items="${enquiryList }" varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${enquiry.subject }</td>
									<td>${enquiry.description }</td>
									<td class="valigntop"><div class="btn-group">
											<button class="btn btn-warning"
												style="float: right; margin-right: 10px;"
												data-toggle="modal" data-target="#smallmodal">REPLAY
											</button>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- MODAL -->
	<div class="modal fade" id="smallmodal" tabindex="-1" role="dialog"
		aria-labelledby="smallmodalLabel" aria-hidden="true">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white">Reply</strong>
				</div>
				<div class="modal-body">
					<div class="row form-group">
						<div class="col-md-12 col-sm-12 col-12">
							<textarea class="form-control" id="desc" style="height: 150%;"
								placeholder="Type reply here..."></textarea>
						</div>
					</div>
				</div>
				<div class="modal-footer float-right">
					<button type="button" class="btn btn-success" onclick="">Send</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>