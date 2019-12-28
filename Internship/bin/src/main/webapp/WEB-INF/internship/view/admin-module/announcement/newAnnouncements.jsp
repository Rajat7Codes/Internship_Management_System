<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<strong class="card-title text-white">ANNOUNCEMENT</strong>
					<div class="tools">
						<a class="fa fa-repeat btn-color box-refresh" href="javascript:;"></a>
						<a class="t-collapse btn-color fa fa-chevron-down"
							href="javascript:;"></a> <a class="t-close btn-color fa fa-times"
							href="javascript:;"></a>
					</div>
				</div>
				<div class="card-body">

					<form:form
						action="${pageContext.request.contextPath }/admin/announcement/save"
						modelAttribute="announcement" name="announcement"
						id="announcement" method="post">

						<form:hidden path="annId" />
						<form:hidden path="announcementNumber"/>
						<div class="row form-group">
							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="createdDate">Created Date</form:label>
								<form:input path="createdDate" name="createdDate"
									id="createdDate" class="form-control" type="text"
									placeholder="Created Date" />
								<form:errors path="createdDate"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="createdBy">Created By</form:label>
								<form:input path="createdBy" name="createdBy" id="createdBy"
									class="form-control" type="text" placeholder="Created By" />
								<form:errors path="createdBy"></form:errors>
							</div>

						</div>
						<div class="row form-group">
							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="academicSession">Academic Session</form:label>
								<form:select path="academicSession" items="${academicSessionList}"
									itemValue="asId" class="form-control" itemLabel="aSession"
									required="true" />
								<form:errors path="academicSession"></form:errors>
							</div>

							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="academicYear">Academic Year</form:label>
								<form:select path="academicYear" items="${academicYearList}"
									itemValue="ayId" class="form-control" itemLabel="aYear"
									required="true" />
								<form:errors path="academicYear"></form:errors>

							</div>
						</div>
						<div class="row form-group">
							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="announcementFor">Announcement For</form:label>
								<form:select class="form-control" name="announcementFor"
									path="announcementFor" id="announcementFor">
									<form:option value="">--Select Announcement For--</form:option>
									<form:options items="${forList }" itemLabel="annFor"
										itemValue="annForId" />
								</form:select>
								<form:errors path="announcementFor"></form:errors>
							</div>
							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="announcementType">Announcement Type</form:label>
								<form:select name="announcementType" id="announcementType"
									path="announcementType" class="form-control">
									<form:option value="">--Select Announcement Type--</form:option>
									<form:options items="${typeList}" itemLabel="type"
										itemValue="annTypeId" />
								</form:select>
								<form:errors path="announcementType"></form:errors>
							</div>
						</div>
						<div class="row form-group">



							<div class="col-md-6 col-sm-6 col-lg-6 col-6">
								<form:label path="description">Description</form:label>
								<form:textarea path="description" name="description"
									id="description" class="form-control" placeholder="Description" />
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