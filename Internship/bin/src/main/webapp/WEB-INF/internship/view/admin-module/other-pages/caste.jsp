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
					<strong class="card-title text-white">CASTE
						<button class="btn btn-success"
							style="float: right; margin-right: 10px;" data-toggle="modal"
							data-target="#smallmodal">ADD CASTE</button>
					</strong>
				</div>
				<div class="card-body">

					<c:forEach var="category" items="${categoryList }" varStatus="ind">
						<div class="card">
							<div class="card-header">
								<strong class="card-title">${category.categoryName }
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
											<th>Caste</th>
											<th>Caste Number</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="castes" items="${category.getCastes() }"
											varStatus="in">
											<tr>
												<td>${in.index+1 }</td>
												<td>${castes.caste }</td>
												<td>${castes.casteNumber }</td>
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
					<h5 class="modal-title" id="mediumModalLabel">ADD CASTE</h5>
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
									<select class="form-control" name="category" id="category">
										<c:forEach var="cat" items="${categoryList }">
											<option value="${cat.categoryId }">${cat.categoryName }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-3 col-sm-3 col-3">
									<input type="text" name="caste" id="caste" placeholder="Caste"
										class="form-control" />
								</div>
								<div class="col-md-3 col-sm-3 col-3">
									<input type="text" name="casteNumber" id="casteNumber"
										placeholder="Caste Number" class="form-control" />
								</div>
								<div class="col-md-3 col-sm-3 col-3">
									<button class="btn btn-success btn-block" onclick="addCaste();">ADD</button>
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
					action="${pageContext.request.contextPath }/admin/caste/save/"
					name="casteForm" id="casteForm">
					<input type="hidden" name="casteData" id="casteData">
				</form>

			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var casteArray = [];
	var category = 0;
	var casteNameArray = [];
	function addCaste() {

		var casteObject = {
			"caste" : document.getElementById("caste").value,
			"casteNumber" : document.getElementById("casteNumber").value
		}

		casteArray.push(casteObject);
		casteNameArray.push(document.getElementById("caste").value);
		category = document.getElementById("category").value;

		document.getElementById("caste").value = "";
		document.getElementById("casteNumber").value = "";
		document.getElementById("desc").value = casteNameArray;
	}

	function saveData() {
		var casteObject = {
			"categoryId" : category,
			"castes" : casteArray
		}
		document.getElementById("casteData").value = JSON
				.stringify(casteObject);
		document.getElementById("casteForm").submit();
	}
</script>

</html>