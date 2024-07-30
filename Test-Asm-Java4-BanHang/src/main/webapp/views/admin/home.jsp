<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Thống kê quản trị viên</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/fontawesome-free/css/all.min.css' />">
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css' />">
<!-- iCheck -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css' />">
<!-- JQVMap -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/jqvmap/jqvmap.min.css' />">
<!-- AdminLTE -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/dist/css/adminlte.min.css'/>">
<!-- OverlayScrollbars -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'/>">
<!-- Daterangepicker -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.css'/>">
<!-- Summernote -->
<link rel="stylesheet" href="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.css' />">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Preloader -->
		<div class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="<c:url value='/Template/Admin/dist/img/logo.jpg'/>" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" data-widget="fullscreen" href="#" role="button"> <i class="fas fa-expand-arrows-alt"></i></a></li>
				<li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-controlsidebar-slide="true" href="#" role="button"> <i class="fas fa-th-large"></i></a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="admin" class="brand-link"> 
				<img src="<c:url value='/Template/User/img/logo.png'/>" class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="font-weight-light">HIUN!!!!</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="info">
						<a href="#" class="d-block">Tên: ${sessionScope.currentAccounts.username}</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
						<li class="nav-item menu-open">
							<a href="admin" class="nav-link active"> 
								<i class="nav-icon fas fa-tachometer-alt"></i>
								<p>Trang chủ</p>
							</a>
						</li>
						<li class="nav-item">
							<a href="admin/product?action=view" class="nav-link"> 
								<i class="nav-icon fas fa-box"></i>
								<p>
									Sản phẩm <i class="right fas fa-angle-left"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="admin/product?action=view" class="nav-link"> 
										<i class="far fa-circle nav-icon"></i>
										<p>Tổng quan</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="admin/product?action=add" class="nav-link"> 
										<i class="far fa-circle nav-icon"></i>
										<p>Chỉnh sửa</p>
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-12">
							<h1 class="m-0">Thống kê</h1>
						</div>
					</div>
					<!-- /.row -->
				</div>
			</div>
			<section class="content">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Thống kê yêu thích</h3>
					</div>
					<div class="card-body">
						<table id="example1" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>Tên sản phẩm</th>
									<th>Mã sản phẩm</th>
									<th>Tổng số lượt thích</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${products}" var="item">
									<tr>
										<td>${item.name}</td>
										<td><a href="<c:url value='/product?action=detail&id=${item.id}'/>">${item.id}</a></td>
										<td>${item.totalLike}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Table 2 -->
				<br>
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Thông tin yêu thích</h3>
					</div>
					<div class="card-body">
						<div class="form-group">
							<label>Danh sách sản phẩm</label> 
							<select id="selectProduct" class="form-control">
								<option selected disabled>Chọn Sản phẩm</option>
								<c:forEach items="${products}" var="item">
									<option value="${item.id}">${item.name}</option>
								</c:forEach>
							</select>
						</div>
						<table id="example2" class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>ID</th>
									<th>Username</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>

		<footer class="main-footer">
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<script src="<c:url value='/Template/Admin/plugins/jquery/jquery.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/moment/moment.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/jquery-validation/jquery.validate.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/plugins/jquery-validation/additional-methods.min.js'/>"></script>
	<script src="<c:url value='/Template/Admin/dist/js/adminlte.min.js'/>"></script>
	<script>
		$(document).ready(function(){
			$('#selectProduct').on('change', function(){
				var productId = $(this).val();
				$.ajax({
					url: 'admin/favorites?action=loadDetails',
					type: 'POST',
					data: {productId: productId},
					dataType: 'json',
					success: function(response) {
						var tableBody = $('#example2 tbody');
						tableBody.empty();
						$.each(response.data, function(index, user) {
							tableBody.append('<tr><td>' + user.id + '</td><td>' + user.username + '</td><td>' + user.email + '</td></tr>');
						});
					}
				});
			});
		});
	</script>
</body>
</html>
