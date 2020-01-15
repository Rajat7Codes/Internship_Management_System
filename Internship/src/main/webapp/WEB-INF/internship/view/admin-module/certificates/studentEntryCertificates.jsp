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
					<strong class="card-title text-white">STUDENT LIST</strong>
				</div>
				&nbsp;
				<div class="card-body">
					<table id="bootstrap-data-table-export"
						class="table table-striped table-responsive">
						<thead>
							<tr>
								<th>Sr.No.</th>
								<th>Name</th>
								<th>College</th>
								<th>Session</th>
								<th>Joining Date</th>
								<th>Offer Letter</th>
								<th>Joining Letter</th>
								<th>Internship Completion</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="stud" items="${studentEntryList }"
								varStatus="ind">
								<tr>
									<td>${ind.index+1 }</td>
									<td>${stud.firstName }&nbsp;${stud.middleName }&nbsp;${stud.lastName }</td>
									<td>${stud.getCollege().collegeName }</td>
									<td>${stud.getInternshipSession().sessionName }</td>
									<td>${stud.date }</td>
									<td><a data-toggle="tooltip" title="View"
										href="<c:url value='/admin/student/entry/offer/letter/view/${stud.studentEntryId }'  />"><i
											class="text-center p-2 rounded-circle bg-success fa fa-eye"></i></a>

										<a data-toggle="tooltip" title="Print"
										onclick="checkOffer(<c:if test="${stud.offerCount!=1}">null</c:if>${stud.offerCount}, ${stud.studentEntryId })"><i
											class="text-center p-2 rounded-circle bg-success fa fa-print"
											aria-hidden="true"></i>
										<%-- 
												<c:if test="${stud.offerCount==1}">
													<i class="text-center p-2 rounded-circle bg-success fa fa-check" aria-hidden="true"></i>
												</c:if>  --%></a></td>


									<td class="valigntop"><a data-toggle="tooltip"
										title="View"
										href="<c:url value='/admin/student/entry/joining/letter/view/${stud.studentEntryId }'  />">
											<i
											class="text-center p-2 rounded-circle bg-success fa fa-eye"></i>
									</a> <a data-toggle="tooltip" title="Print"
										onclick='checkJoining(<c:if test="${stud.joinCount!=1}">null</c:if>${stud.joinCount}, ${stud.studentEntryId })'>
											<i
											class="text-center p-2 rounded-circle bg-success fa fa-print"
											aria-hidden="true"></i>
									</a></td>
									<td class="valigntop"><a title="View"
										href="<c:url value='/admin/student/entry/internship/certificate/view/${stud.studentEntryId }'  />"><i
											class="text-center p-2 rounded-circle bg-success fa fa-eye"></i></a>

										<a title="Print"
										onclick="checkInternship(<c:if test="${stud.internshipCount!=1}">null</c:if>${stud.internshipCount}, ${stud.studentEntryId })">
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

	<script>
		function checkJoining(joinCount, studentId) {
			if (joinCount == 1) {
				window.alert('Joining Letter Already Given');
			} else {
				window.location = "/admin/student/entry/joining/letter/print/"
						+ studentId;
			}
		}
		function checkOffer(offerCount, studentId) {
			if (offerCount == 1) {
				window.alert('Offer Letter Already Given');
			} else {
				window.location = "/admin/student/entry/offer/letter/print/"
						+ studentId;
			}
		}
		function checkInternship(internshipCount, studentId) {
			if (internshipCount == 1) {
				window.alert('Internship Certificate Already Given');
			} else {
				window.location = "/admin/student/entry/internship/certificate/print/"
						+ studentId;
			}
		}
	</script>
</body>
</html>