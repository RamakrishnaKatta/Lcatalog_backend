<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8	">
	<title>Dashboard</title>
</head>

<body>
	<%@ include file="header.jsp"%>
	<%@ include file="side-menu.jsp"%>
	<style type="text/css">
.customImg {
	padding: 20px !important;
}

.info-box-number {
	font-size: 40px;
	padding: 5px;
}
</style>


	<div class="content-wrapper" ng-controller="dashboardStats"
		style="min-height: 303px; padding: 20px;">

		<div class="row">

			<div class="col-sm-3">
				<div class="info-box">
					<!-- Apply any bg-* class to to the icon to color it -->
					<span class="info-box-icon bg-blue"><i
						class="customImg glyphicon glyphicon-king"></i></span>
					<div class="info-box-content">
						<span class="info-box-text"><b>Vendors</b></span> <span
							class="info-box-number vendors" ng-model="vendorCount"></span>
						<!--  {{vendorCount}}</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>

			<div class="col-sm-3">
				<div class="info-box">
					<!-- Apply any bg-* class to to the icon to color it -->
					<span class="info-box-icon bg-blue"><i
						class="customImg glyphicon glyphicon-text-color"></i></span>
					<div class="info-box-content">
						<span class="info-box-text"><b>Articles</b></span> <span
							class="info-box-number articles" ng-model="articleCount"></span>
						<!-- 				    {{articleCount}}</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>

			<div class="col-sm-3">
				<div class="info-box">
					<!-- Apply any bg-* class to to the icon to color it -->
					<span class="info-box-icon bg-blue"><i
						class="customImg glyphicon glyphicon-user"></i></span>
					<div class="info-box-content">
						<span class="info-box-text"><b>Users</b></span> <span
							class="info-box-number users" ng-model="userCount"></span>
						<!-- 				    {{userCount}}</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>
			<div class="col-sm-3">
				<div class="info-box">
					<!-- Apply any bg-* class to to the icon to color it -->
					<span class="info-box-icon bg-blue"><i
						class="customImg glyphicon glyphicon-plus"></i></span>
					<div class="info-box-content">
						<span class="info-box-text"><b>Vendor Requests</b></span> <span
							class="info-box-number reqs"></span>
						<!-- 				    {{requestCount}}</span> -->
					</div>
					<!-- /.info-box-content -->
				</div>
				<!-- /.info-box -->
			</div>

		</div>
		<br><br><br><br>
			<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="box box-info main_box"></div>
						<!-- /.box-header -->
						<div class=" tableSection sectionBgWhite">
							<div id="resizable"
								style="height: 300px; border: 1px solid gray;">
								<div id="chartContainer1" style="height: 100%; width: 100%;"></div>
							</div>

						</div>
						<!-- /.box-body -->

					</div>
					<div class="col-md-2"></div>
				</div>
	</div>
	</div>
	<!-- Loader -->
	<div class="fader">
		<div class="loader"></div>
	</div>

</body>
</html>
<script type="text/javascript"
	src="<c:url value="/resources/js/utils.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/dashboard.js" />"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/demo.js" />"></script>