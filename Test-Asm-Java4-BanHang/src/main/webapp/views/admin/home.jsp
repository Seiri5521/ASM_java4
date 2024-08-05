<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quản Lý | Admin</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/fontawesome-free/css/all.min.css'/>">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css'/>">
<!-- iCheck -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css'/>">
<!-- JQVMap -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/jquery-jvectormap.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/dist/css/adminlte.min.css'/>">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css'/>">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.css'/>">
<!-- summernote -->
<link rel="stylesheet"
	href="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.css'/>">

</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">


		<!-- Thêm jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

		<!-- Thêm jVectorMap CSS -->
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/jquery-jvectormap.css">

		<!-- Thêm jVectorMap JS -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/jquery-jvectormap.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/maps/jquery-jvectormap-world-mill-en.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/maps/jquery-jvectormap-vn-mill.js"></script>
		<!-- Thêm thư viện jVectorMap -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/jquery-jvectormap.min.js"></script>
		<!-- Thêm bản đồ Việt Nam (vn_mill) -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/jvectormap/2.0.5/jquery-jvectormap-vn-mill.js"></script>

		<!-- Preloader -->
		<div
			class="preloader flex-column justify-content-center align-items-center">
			<img class="animation__shake" src="dist/img/AdminLTELogo.png"
				alt="AdminLTELogo" height="60" width="60">
		</div>

		<!-- Navbar -->
		<nav
			class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
					href="#" role="button"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a
					href="index3.html" class="nav-link">Trang Chủ</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#"
					class="nav-link">Liên Hệ</a></li>
			</ul>

			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Navbar Search -->
				<li class="nav-item"><a class="nav-link"
					data-widget="navbar-search" href="#" role="button"> <i
						class="fas fa-search"></i>
				</a>
					<div class="navbar-search-block">
						<form class="form-inline">
							<div class="input-group input-group-sm">
								<input class="form-control form-control-navbar" type="search"
									placeholder="Search" aria-label="Search">
								<div class="input-group-append">
									<button class="btn btn-navbar" type="submit">
										<i class="fas fa-search"></i>
									</button>
									<button class="btn btn-navbar" type="button"
										data-widget="navbar-search">
										<i class="fas fa-times"></i>
									</button>
								</div>
							</div>
						</form>
					</div></li>

				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-comments"></i>
						<span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img
									src="<c:url value='/Template/Admin/dist/img/user1-128x128.jpg' />"
									alt="User Avatar" class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Rôn Phạm <span class="float-right text-sm text-danger"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Gọi lại cho tôi khi bạn rảnh</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img
									src="<c:url value='/Template/Admin/dist/img/user8-128x128.jpg' />"
									alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Chương Vũ <span class="float-right text-sm text-muted"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Tôi đã gửi báo cáo cho bạn</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img
									src="<c:url value='/Template/Admin/dist/img/user3-128x128.jpg' />"
									alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Khánh "Đại gia" <span class="float-right text-sm text-warning"><i
											class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">DS đơn đặt hàng tuần này</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">Xem tất cả
							tin nhắn</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link"
					data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span
						class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-item dropdown-header">5 Thông báo</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-envelope mr-2"></i> 4 Tin nhắn mới <span
							class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i
							class="fas fa-users mr-2"></i> 8 Yêu cầu kết bạn <span
							class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i>
							3 Báo cáo mới <span class="float-right text-muted text-sm">2
								days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">Xem tất cả
							thông báo</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					data-widget="fullscreen" href="#" role="button"> <i
						class="fas fa-expand-arrows-alt"></i>
				</a></li>
			</ul>
		</nav>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="index3.html" class="brand-link"> <img
				src="<c:url value='/Template/Admin/dist1/img/logo.png' />" alt=""
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">HUIN</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="<c:url value='/Template/Admin/dist/img/CLy.jpg' />"
							class="img-circle elevation-2" alt="">
					</div>
					<div class="info">
						<a href="#" class="d-block">LiLy Cute</a>
					</div>
				</div>

				<!-- SidebarSearch Form -->
				<div class="form-inline">
					<div class="input-group" data-widget="sidebar-search">
						<input class="form-control form-control-sidebar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-sidebar">
								<i class="fas fa-search fa-fw"></i>
							</button>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item menu-open"><a href="#"
							class="nav-link active"> <i
								class="nav-icon fas fa-tachometer-alt"></i>
								<p>
									Home <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item menu-open"><a href="/admin/user.jsp"
									class="nav-link"> <i
										class="far fa-circle nav-icon far fa-circle text-danger"></i>
										<p>Quản Lý Nhân Viên</p>
								</a></li>
								<li class="nav-item"><a href="./manage-product.jsp"
									class="nav-link"> <i
										class="far fa-circle nav-icon far fa-circle text-info"></i>
										<p>Quản Lý Sản Phẩm</p>
								</a></li>
								<li class="nav-item"><a href="./index3.html"
									class="nav-link"> <i
										class="far fa-circle nav-icon far fa-circle text-warning"></i>
										<p>Thống Kê</p>
								</a></li>
							</ul></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">QUẢN LÝ ĐƠN HÀNG</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Quản lý</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<section class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-lg-3 col-6">
							<div class="small-box bg-info">
								<div class="inner">
									<h3>150</h3>

									<p>Đơn hàng thành công</p>
								</div>
								<div class="icon">
									<i class="ion ion-bag"></i>
								</div>
								<a href="#" class="small-box-footer">Chi tiết <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>

						<div class="col-lg-3 col-6">
							<div class="small-box bg-success">
								<div class="inner">
									<h3>10</h3>

									<p>Đơn hàng hủy</p>
								</div>
								<div class="icon">
									<i class="ion ion-stats-bars"></i>
								</div>
								<a href="#" class="small-box-footer">Chi tiết <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="small-box bg-warning">
								<div class="inner">
									<h3>44</h3>

									<p>Thành viên</p>
								</div>
								<div class="icon">
									<i class="ion ion-person-add"></i>
								</div>
								<a href="#" class="small-box-footer">Chi tiết <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>

						<div class="col-lg-3 col-6">
							<div class="small-box bg-danger">
								<div class="inner">
									<!-- <h3>65</h3>

									<p>Khách hàng thân thiết</p> -->
									<h3>
										77<sup style="font-size: 20px">%</sup>
									</h3>

									<p>Doanh thu</p>
								</div>
								<div class="icon">
									<i class="ion ion-pie-graph"></i>
								</div>
								<a href="#" class="small-box-footer">Chi tiết <i
									class="fas fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>


					<div class="card">
						<div class="card-header">
							<h3 class="card-title">QUẢN LÝ SẢN PHẨM</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<table id="example1" class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Mã Sản Phẩm</th>
										<th>Tên Sản Phẩm</th>
										<th>Hình Ảnh</th>
										<th>Giá</th>
										<th>Size</th>
										<th>Màu sắc</th>
										<th>Trạng Thái</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>CK01</td>
										<td>Giày mules cao gót Toni Puffy-Strap Crossover - Cam</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK01.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>2,190,000đ</td>
										<td>35, 36, 37</td>
										<td>Cam</td>
										<td>Hàng mới về</td>
									</tr>
									<tr>
										<td>CK02</td>
										<td>Giày mules cao gót Toni Knotted Puffy-Strap - Đen họa
											tiết</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK02.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>1,790,000đ</td>
										<td>35, 36, 37, 38, 39</td>
										<td>Đen</td>
										<td>Hàng mới về</td>
									</tr>
									<tr>
										<td>CK03</td>
										<td>Giày cao gót mũi vuông Tweed Pearl Embellished
											Trapeze-Heel Slingback - Đen họa tiết</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK03.jpg' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>3,650,000đ</td>
										<td>34, 35, 36, 37, 38, 39</td>
										<td>Đen họa tiết</td>
										<td>Hàng mới về</td>
									</tr>
									<tr>
										<td>CK04</td>
										<td>Dép quai ngang mũi tròn Laine Metallic-Buckle
											Flatform - Đen</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK04.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>1,890,000đ</td>
										<td>35, 36, 37</td>
										<td>Đen</td>
										<td>Hàng mới về</td>
									</tr>
									<tr>
										<td>CK05</td>
										<td>Giày sandals đế thấp Maisie Sports - Trắng</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK05.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>2,590,000 đ</td>
										<td>34, 35, 36, 37, 38, 39</td>
										<td>Trắng</td>
										<td>Hàng mới về</td>
									</tr>
									<tr>
										<td>CK06</td>
										<td>Giày cao gót mũi nhọn Croc-Embossed Stiletto - Hoạ
											tiết da báo xanh sẫm</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK06.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>2,450,000đ</td>
										<td>35, 36, 37</td>
										<td>Hoạ tiết da báo xanh sẫm</td>
										<td>Hàng mới về</td>
									</tr>
									<tr>
										<td>CK07</td>
										<td>Giày mules cao gót Sculptural-Heel Strappy - Xanh
											nhạt
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK07.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>1,490,000đ</td>
										<td>35, 36, 37, 38, 39, 40</td>
										<td>Xanh nhạt</td>
										<td>Sắp hết hàng</td>
									</tr>
									<tr>
										<td>CK08</td>
										<td>Giày mules cao gót Cut-Out Cylinder-Heel - Phấn</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK08.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>1,390,000đ</td>
										<td>35, 36, 37</td>
										<td>Phấn</td>
										<td>Sắp hết hàng</td>
									</tr>
									<tr>
										<td>CK09</td>
										<td>Giày mules Double-Strap Braided-Heel - Nâu</td>
										<td><img
											src="<c:url value='/Template/Admin/dist/img/CK09.webp' />"
											class="img-size-50 img-circle mr-3"></td>
										<td>1,390,000đ</td>
										<td>35, 36, 37</td>
										<td>Nâu</td>
										<td>Sắp hết hàng</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->

					<div class="row">
						<section class="col-lg-7 connectedSortable">
							THỐNG KÊ DOANH THU THÁNG 7
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">
										<i class="fas fa-chart-pie mr-1"></i> Sales
									</h3>
									<div class="card-tools">
										<ul class="nav nav-pills ml-auto">
											<li class="nav-item"><a class="nav-link active"
												href="#revenue-chart" data-toggle="tab">Area</a></li>
											<li class="nav-item"><a class="nav-link"
												href="#sales-chart" data-toggle="tab">Donut</a></li>
										</ul>
									</div>
								</div>
								<div class="card-body">
									<div class="tab-content p-0">
										Morris chart - Sales
										<div class="chart tab-pane active" id="revenue-chart"
											style="position: relative; height: 300px;">
											<canvas id="revenue-chart-canvas" height="300"
												style="height: 300px;"></canvas>
										</div>
										<div class="chart tab-pane" id="sales-chart"
											style="position: relative; height: 300px;">
											<canvas id="sales-chart-canvas" height="300"
												style="height: 300px;"></canvas>
										</div>
									</div>
								</div>
							</div>


							PHÂN CÔNG CÔNG VIỆC (29/7/24 - 04/8/24)
							<div class="card">
								<div class="card-header">
									<h3 class="card-title">
										<i class="ion ion-clipboard mr-1"></i> To Do List
									</h3>

									<div class="card-tools">
										<ul class="pagination pagination-sm">
											<li class="page-item"><a href="#" class="page-link">&laquo;</a></li>
											<li class="page-item"><a href="#" class="page-link">1</a></li>
											<li class="page-item"><a href="#" class="page-link">2</a></li>
											<li class="page-item"><a href="#" class="page-link">3</a></li>
											<li class="page-item"><a href="#" class="page-link">&raquo;</a></li>
										</ul>
									</div>
								</div>

								<div class="card-body">
									<ul class="todo-list" data-widget="todo-list">
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span> chưa làm
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo1" id="todoCheck1">
												<label for="todoCheck1"></label>
											</div> đã làm <span class="text"><small
												class="badge badge-danger"><i class="far fa-clock"></i>
													2 mins</small> Chỉnh sửa
												<div class="tools">
													<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
												</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo2" id="todoCheck2"
													checked> <label for="todoCheck2"></label>
											</div> <span class="text">Nhập hàng</span> <small
											class="badge badge-info"><i class="far fa-clock"></i>
												4 giờ trước</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo3" id="todoCheck3">
												<label for="todoCheck3"></label>
											</div> <span class="text">Kiểm kho</span> <small
											class="badge badge-warning"><i class="far fa-clock"></i>
												2 ngày</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo4" id="todoCheck4">
												<label for="todoCheck4"></label>
											</div> <span class="text">Chỉnh sửa dữ liệu nhân viên</span> <small
											class="badge badge-success"><i class="far fa-clock"></i>
												1 tuần</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo5" id="todoCheck5">
												<label for="todoCheck5"></label>
											</div> <span class="text">Kiểm tra email của khách hàng gửi</span>
											<small class="badge badge-primary"><i
												class="far fa-clock"></i> 3 ngày</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
										<li><span class="handle"> <i
												class="fas fa-ellipsis-v"></i> <i class="fas fa-ellipsis-v"></i>
										</span>
											<div class="icheck-primary d-inline ml-2">
												<input type="checkbox" value="" name="todo6" id="todoCheck6">
												<label for="todoCheck6"></label>
											</div> <span class="text">Lên đơn hàng cho khách</span> <small
											class="badge badge-secondary"><i class="far fa-clock"></i>
												1 ngày</small>
											<div class="tools">
												<i class="fas fa-edit"></i> <i class="fas fa-trash-o"></i>
											</div></li>
									</ul>
								</div>

								<div class="card-footer clearfix">
									<button type="button" class="btn btn-primary float-right">
										<i class="fas fa-plus"></i> Thêm nhiệm vụ
									</button>
								</div>
							</div>
						</section>

						<section class="col-lg-5 connectedSortable">
							DOANH THU NĂM 2024
							<div class="card bg-gradient-info">
								<div class="card-header border-0">
									<h3 class="card-title">
										<i class="fas fa-th mr-1"></i> Sales Graph
									</h3>

									<div class="card-tools">
										<button type="button" class="btn bg-info btn-sm"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn bg-info btn-sm"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<canvas class="chart" id="line-chart"
										style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
								</div>

								<div class="card-footer bg-transparent">
									<div class="row">
										<div class="col-4 text-center">
											<input type="text" class="knob" data-readonly="true"
												value="20" data-width="60" data-height="60"
												data-fgColor="#39CCCC">

											<div class="text-white">Mail-Orders</div>
										</div>

										<div class="col-4 text-center">
											<input type="text" class="knob" data-readonly="true"
												value="50" data-width="60" data-height="60"
												data-fgColor="#39CCCC">

											<div class="text-white">Online</div>
										</div>

										<div class="col-4 text-center">
											<input type="text" class="knob" data-readonly="true"
												value="30" data-width="60" data-height="60"
												data-fgColor="#39CCCC">

											<div class="text-white">In-Store</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Calendar -->
							<div class="card bg-gradient-success">
								<div class="card-header border-0">

									<h3 class="card-title">
										<i class="far fa-calendar-alt"></i> Calendar
									</h3>
									<!-- tools card -->
									<div class="card-tools">
										<!-- button with a dropdown -->
										<div class="btn-group">
											<button type="button"
												class="btn btn-success btn-sm dropdown-toggle"
												data-toggle="dropdown" data-offset="-52">
												<i class="fas fa-bars"></i>
											</button>
											<div class="dropdown-menu" role="menu">
												<a href="#" class="dropdown-item">Add new event</a> <a
													href="#" class="dropdown-item">Clear events</a>
												<div class="dropdown-divider"></div>
												<a href="#" class="dropdown-item">View calendar</a>
											</div>
										</div>
										<button type="button" class="btn btn-success btn-sm"
											data-card-widget="collapse">
											<i class="fas fa-minus"></i>
										</button>
										<button type="button" class="btn btn-success btn-sm"
											data-card-widget="remove">
											<i class="fas fa-times"></i>
										</button>
									</div>
									<!-- /. tools -->
								</div>
								<!-- /.card-header -->
								<div class="card-body pt-0">
									<!--The calendar -->
									<div id="calendar" style="width: 100%"></div>
								</div>
								<!-- /.card-body -->
							</div>
							<!-- /.card -->
						</section>
						<!-- right col -->
					</div>
					<!-- /.row (main row) -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Branch Map Section -->
		<div class="card bg-gradient-primary">
			<div class="card-header border-0">
				<h3 class="card-title">
					<i class="fas fa-map-marker-alt mr-1"></i> Visitors
				</h3>
				<!-- card tools -->
				<div class="card-tools">
					<button type="button" class="btn btn-primary btn-sm daterange"
						title="Date range">
						<i class="far fa-calendar-alt"></i>
					</button>
					<button type="button" class="btn btn-primary btn-sm"
						data-card-widget="collapse" title="Collapse">
						<i class="fas fa-minus"></i>
					</button>
				</div>
			</div>
			<div class="card-body">
				<div id="map" style="height: 250px; width: 100%;"></div>
			</div>
			<div class="card-footer bg-transparent">
				<div class="row">
					<div class="col-4 text-center">
						<div id="sparkline-1"></div>
						<div class="text-white">Visitors</div>
					</div>
					<div class="col-4 text-center">
						<div id="sparkline-2"></div>
						<div class="text-white">Online</div>
					</div>
					<div class="col-4 text-center">
						<div id="sparkline-3"></div>
						<div class="text-white">Sales</div>
					</div>
				</div>
			</div>
		</div>



		<footer class="main-footer text-center">
			<strong>Copyright &copy; 2024 <a href="https://adminlte.io">by
					HUIN</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block"></div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>

		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="<c:url value='/Template/Admin/plugins/jquery/jquery.min.js' />"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="<c:url value='/Template/Admin/plugins/jquery-ui/jquery-ui.min.js' />"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/Template/Admin/plugins/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<!-- ChartJS -->
	<script
		src="<c:url value='/Template/Admin/plugins/chart.js/Chart.min.js' />"></script>
	<!-- Sparkline -->
	<script
		src="<c:url value='/Template/Admin/plugins/sparklines/sparkline.js' />"></script>
	<!-- JQVMap -->
	<script
		src="<c:url value='/Template/Admin/plugins/jqvmap/jquery.vmap.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/jqvmap/maps/jquery.vmap.usa.js' />"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="<c:url value='/Template/Admin/plugins/jquery-knob/jquery.knob.min.js' />"></script>
	<!-- daterangepicker -->
	<script
		src="<c:url value='/Template/Admin/plugins/moment/moment.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/daterangepicker/daterangepicker.js' />"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="<c:url value='/Template/Admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js' />"></script>
	<!-- Summernote -->
	<script
		src="<c:url value='/Template/Admin/plugins/summernote/summernote-bs4.min.js' />"></script>
	<!-- overlayScrollbars -->
	<script
		src="<c:url value='/Template/Admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js' />"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/Template/Admin/dist/js/adminlte.js' />"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/Template/Admin/dist/js/demo.js' />"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="<c:url value='/Template/Admin/dist/js/pages/dashboard.js' />"></script>


	<!-- DataTables  & Plugins -->
	<script
		src="<c:url value='/Template/Admin/plugins/datatables/jquery.dataTables.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-responsive/js/dataTables.responsive.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/dataTables.buttons.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/jszip/jszip.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/pdfmake/pdfmake.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/pdfmake/vfs_fonts.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.html5.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.print.min.js' />"></script>
	<script
		src="<c:url value='/Template/Admin/plugins/datatables-buttons/js/buttons.colVis.min.js' />"></script>

	<!-- Page specific script -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY"></script>
	<script>
		$(function() {
			// Initialize DataTables for example1
			$("#example1").DataTable(
					{
						"responsive" : true,
						"lengthChange" : false,
						"autoWidth" : false,
						"buttons" : [ "copy", "csv", "excel", "pdf", "print",
								"colvis" ]
					}).buttons().container().appendTo(
					'#example1_wrapper .col-md-6:eq(0)');

			// Initialize DataTables for example2
			$('#example2').DataTable({
				"paging" : true,
				"lengthChange" : false,
				"searching" : false,
				"ordering" : true,
				"info" : true,
				"autoWidth" : false,
				"responsive" : true,
			});
	</script>

</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
 --%>