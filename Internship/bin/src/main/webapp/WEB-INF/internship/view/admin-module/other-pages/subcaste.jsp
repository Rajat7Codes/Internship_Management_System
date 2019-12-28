<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div class="row">

		<div class="col-md-12">
			<div class="card card-topline-darkgreen">
				<div class="card-header card-head pl-4" id="grad">
					<strong class="card-title text-white">SUB-CASTE
						<button class="btn btn-success"
							style="float: right; margin-right: 10px;" data-toggle="modal"
							data-target="#smallmodal">ADD SUB-CASTE</button>
					</strong>
				</div>
				<div class="card-body">

					<c:forEach var="castes" items="${casteList }" varStatus="ind">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">${castes.caste }
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
											<th>Sub-Caste</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="subcastes" items="${castes.getSubcastes() }"
											varStatus="in">
											<tr>
												<td>${in.index+1 }</td>
												<td>${subcastes.subcaste }</td>
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
					<h5 class="modal-title" id="mediumModalLabel">ADD SUB-CASTE</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row form-group">
						<div class="col-md-12 col-sm-12 col-12">

							<div class="row form-group">
								<div class="col-md-4 col-sm-4 col-4">
									<select class="form-control" name="caste" id="caste">
										<c:forEach var="caste" items="${casteList }">
											<option value="${caste.casteId }">${caste.caste }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-4 col-sm-4 col-4">
									<input type="text" name="subcaste" id="subcaste"
										placeholder="Sub-Caste" class="form-control" />
								</div>
								<div class="col-md-4 col-sm-4 col-4">
									<button class="btn btn-success btn-block"
										onclick="addSubCaste();">ADD</button>
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
					action="${pageContext.request.contextPath }/admin/subcaste/save/"
					name="subcasteForm" id="subcasteForm">
					<input type="hidden" name="subcasteData" id="subcasteData">
				</form>

			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var subcasteArray = [];
	var caste = 0;
	var subcasteNameArray = [];
	function addSubCaste() {

		var subCasteObject = {
			"subcaste" : document.getElementById("subcaste").value
		}

		subcasteArray.push(subCasteObject);
		subcasteNameArray.push(document.getElementById("subcaste").value);
		caste = document.getElementById("caste").value;
		document.getElementById("subcaste").value = "";

		document.getElementById("desc").value = subcasteNameArray;
	}

	function saveData() {
		var subCasteObject = {
			"casteId" : caste,
			"subcastes" : subcasteArray
		}
		document.getElementById("subcasteData").value = JSON
				.stringify(subCasteObject);
		document.getElementById("subcasteForm").submit();
	}
</script>

</html>