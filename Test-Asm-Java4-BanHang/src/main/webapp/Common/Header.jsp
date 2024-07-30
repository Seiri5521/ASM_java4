<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
/*** Navbar ***/
.navbar-light .navbar-nav .nav-link {
	font-family: 'Nunito', sans-serif;
	position: relative;
	margin-right: 25px;
	padding: 35px 0;
	color: black !important;
	font-size: 18px;
	font-weight: 600;
	outline: none;
	transition: .5s;
}

.sticky-top.navbar-light .navbar-nav .nav-link {
	padding: 20px 0;
	color: var(--dark) !important;
}

.navbar-light .navbar-nav .nav-link:hover, .navbar-light .navbar-nav .nav-link.active
	{
	color: var(--main-color) !important;
}

.navbar-light .navbar-brand img {
	max-height: 60px;
	transition: .5s;
}

.sticky-top.navbar-light .navbar-brand img {
	max-height: 45px;
}

@media ( max-width : 991.98px) {
	.sticky-top.navbar-light {
		position: relative;
		background: #FFFFFF;
	}
	.navbar-light .navbar-collapse {
		margin-top: 15px;
		border-top: 1px solid #DDDDDD;
	}
	.navbar-light .navbar-nav .nav-link, .sticky-top.navbar-light .navbar-nav .nav-link
		{
		padding: 10px 0;
		margin-left: 0;
		color: var(--dark) !important;
	}
	.navbar-light .navbar-brand img {
		max-height: 45px;
	}
}

@media ( min-width : 992px) {
	.navbar-light {
		position: absolute;
		width: 100%;
		top: 0;
		left: 0;
		border-bottom: 1px solid rgba(256, 256, 256, .1);
		z-index: 999;
	}
	.sticky-top.navbar-light {
		position: fixed;
		background: #FFFFFF;
	}
	.navbar-light .navbar-nav .nav-link::before {
		position: absolute;
		content: "";
		width: 0;
		height: 2px;
		bottom: -1px;
		left: 50%;
		background: var(--main-color);
		transition: .5s;
	}
	.navbar-light .navbar-nav .nav-link:hover::before, .navbar-light .navbar-nav .nav-link.active::before
		{
		width: calc(100% - 2px);
		left: 1px;
	}
	.navbar-light .navbar-nav .nav-link.nav-contact::before {
		display: none;
	}
}

.breadcrumb-item+.breadcrumb-item::before {
	color: rgba(255, 255, 255, .5);
}

.dropdown-menu {
	width: 1265px
}

small.lang-toggle {
	cursor: pointer; /* Hiệu ứng chuột khi đưa vào */
}
/* CSS cho hình ảnh avatar người dùng */
.avatar {
    width: 30px;
    height: 30px;
    border-radius: 50%;
    object-fit: cover;
    margin-left: 10px;
}

</style>
</head>
<body>

	<!-- Topbar Start -->
	<div class="container-fluid px-5 d-none d-lg-block">
		<div class="row gx-0">
			<div class="col-lg-6">
				<div class="d-inline-flex align-items-center justify-content-end"
					style="height: 45px;">
					<small class="me-3 text-black text-end lang-toggle">Trợ
						giúp</small> <span class="mx-2 text-black"> </span> <small
						class="me-3 text-black text-end lang-toggle">Hệ thống cửa
						hàng</small> <span class="mx-2 text-black"> </span> <small
						class="me-3 text-black text-end lang-toggle">English</small> <span
						class="mx-2 text-black">|</span> <small
						class="text-black text-end lang-toggle">Tiếng Việt</small>
				</div>
			</div>
		</div>
	</div>
	<!-- Topbar End -->


	<!-- Page Loader -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand text-danger" href="<c:url value='/index' />">
				<i class="fas fa-shopping-cart mr-2"></i> HIUN Shop <a href="#"
				class="nav-link dropdown-toggle" data-toggle="dropdown"> Thể
					Loại </a>
				<div class="dropdown-menu m-0" id="dropdownMenu">
					<div class="row">
						<!-- Mục Nam -->
						<div class="col-sm-4 col-xs-6">
							<ul class="list-unstyled">
								<li>Nam</li>
								<li><a href="category?type=nam-ao">Áo</a></li>
								<li><a href="category?type=nam-quan">Quần</a></li>
							</ul>
						</div>
						<!-- Mục Nữ -->
						<div class="col-sm-4 col-xs-6">
							<ul class="list-unstyled">
								<li>Nữ</li>
								<li><a href="category?type=nu-ao">Áo</a></li>
								<li><a href="category?type=nu-quan">Quần</a></li>
							</ul>
						</div>
						<!-- Mục Trẻ Em -->
						<div class="col-sm-4 col-xs-6">
							<ul class="list-unstyled">
								<li>Trẻ Em</li>
								<li><a href="category?type=treem-be-gai">Bé Gái</a></li>
								<li><a href="category?type=treem-be-trai">Bé Trai</a></li>
							</ul>
						</div>
					</div>
				</div>

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarContent" aria-controls="navbarContent"
					aria-expanded="false" aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarContent">
					<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="cart"><i
								class="fas fa-shopping-cart"></i></a></li>
						<!-- Icon tìm kiếm -->
						<li class="nav-item"><a class="nav-link" href="#"
							data-toggle="modal" data-target="#searchModal"> <i
								class="fas fa-search"></i>
						</a></li>

						<!-- Modal tìm kiếm -->
						<div class="modal fade" id="searchModal" tabindex="-1"
							role="dialog" aria-labelledby="searchModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="searchModalLabel">Tìm Kiếm
											Sản Phẩm</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<input type="text" id="search-input" class="form-control"
											placeholder="Nhập tên sản phẩm...">
										<button id="search-btn" class="btn btn-primary mt-2">Tìm
											kiếm</button>
									</div>
								</div>
							</div>
						</div>

						<li class="nav-item"><a class="nav-link" href="favorites"><i
								class="fas fa-heart"></i></a></li>
						<c:choose>
							<c:when test="${not empty sessionScope.currentAccounts}">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" id="userDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Xin chào,
										${sessionScope.currentAccounts.fullname} <img
										src="${sessionScope.currentAccounts.photo}" alt="User Avatar"
										class="avatar">
								</a>
									<div class="dropdown-menu" aria-labelledby="userDropdown">
										<a class="dropdown-item" href="contact">Liên Hệ</a> <a
											class="dropdown-item" href="history">Lịch sử</a> <a
											class="dropdown-item" href="<c:url value='/profile'/>">Hồ
											Sơ</a> <a class="dropdown-item" href="<c:url value='/orders'/>">Đơn
											Hàng</a>
										<c:if
											test="${sessionScope.currentAccounts.getAdmin() == true}">
											<a class="dropdown-item" href="<c:url value='/admin'/>">Quản
												Trị</a>
										</c:if>

										<a class="dropdown-item" data-toggle="modal"
											data-target="#changePassModal" href="#">Đổi Mật Khẩu</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item" href="<c:url value='/logout'/>">Đăng
											Xuất</a>
									</div></li>
							</c:when>

							<c:otherwise>
								<li class="nav-item"><a class="nav-link"
									href="<c:url value='/login'/>" ng-show="!isLoggedIn"><i
										class="fas fa-user"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
		</div>
	</nav>

	<!-- Modal -->
	<div class="modal fade" id="changePassModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="exampleModalLabel">Đổi
						Mật Khẩu</h5>
					<button type="button" class="close btn btn-danger rounded-pill"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="password" name="currentPass" id="currentPass"
							class="form-control rounded-pill" placeholder="Mật Khẩu Hiện Tại"
							required>
					</div>
					<div class="form-group">
						<input type="password" name="newPass" id="newPass"
							class="form-control rounded-pill" placeholder="Mật Khẩu Mới"
							required>
					</div>
					<h5 class="text-center text-danger" id="messageChangePass"></h5>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary rounded-pill"
						data-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary rounded-pill"
						id="changePassBtn">Lưu Thay Đổi</button>
				</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function() {
			// Optional: Activate Bootstrap tooltips
			$('[data-toggle="tooltip"]').tooltip();

			// Activate Bootstrap dropdowns
			$('.dropdown-toggle').dropdown();
		});

		// Ajax function for changing password
		$('#changePassBtn')
				.click(
						function() {
							$('#messageChangePass').text('');
							var currentPass = $('#currentPass').val();
							var newPass = $('#newPass').val();
							var formData = {
								'currentPass' : currentPass,
								'newPass' : newPass
							};
							$
									.ajax({
										url : 'changePass',
										type : 'POST',
										data : formData
									})
									.then(
											function(data) {
												$('#messageChangePass')
														.text(
																"Mật khẩu đã được thay đổi!!");
											})
									.fail(
											function(error) {
												$('#messageChangePass')
														.text(
																"LỖI!, Vui lòng kiểm tra thông tin của bạn!!");
											});
						});

		$(document).ready(function() {
			// Khi nhấn nút tìm kiếm trong modal
			$('#search-btn').click(function() {
				var query = $('#search-input').val();
				if (query) {
					window.location.href = 'search?query=' + query;
				}
			});
		});
	</script>