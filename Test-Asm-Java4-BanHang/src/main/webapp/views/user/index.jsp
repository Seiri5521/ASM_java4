++<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HIUN</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<style>
body {
	background-color: white; /* Màu nền nhẹ nhàng */++
	color: #343a40; /* Màu chữ */
}

.tm-container-content {
	padding-top: 80px; /* Để navbar không che phần content */
}

.tm-gallery .card {
	border: none; /* Bỏ viền card */
	transition: transform 0.2s ease-in-out; /* Hiệu ứng hover */
}

.tm-gallery .card:hover {
	transform: translateY(-5px); /* Dịch chuyển lên khi hover */
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1); /* Đổ bóng khi hover */
}

.tm-gallery .card img {
	height: 220px; /* Điều chỉnh chiều cao hình ảnh */
	object-fit: cover; /* Chỉnh hình ảnh phù hợp với kích thước card */
}

.tm-gallery .card-title {
	font-size: 1.2rem; /* Kích thước tiêu đề */
	margin-bottom: 0.75rem; /* Khoảng cách với mô tả */
}

.tm-gallery .card-text {
	font-size: 0.9rem; /* Kích thước văn bản mô tả */
	color: #6c757d; /* Màu văn bản mô tả */
}

.tm-gallery .btn-primary {
	background-color: #dc3545; /* Màu nút */
	border-color: #dc3545; /* Màu viền nút */
}

.tm-gallery .btn-primary:hover {
	background-color: #c82333; /* Màu nút hover */
	border-color: #bd2130; /* Màu viền nút hover */
}

.pagination {
	justify-content: center; /* Căn giữa phân trang */
}

.pagination .page-item.active .page-link {
	background-color: #dc3545; /* Màu nền trang hiện tại */
	border-color: #dc3545; /* Màu viền trang hiện tại */
}

.pagination .page-link {
	color: #dc3545; /* Màu chữ phân trang */
}
/* Carousel */
#heroCarousel .carousel-item {
	height: 100vh; /* Chiều cao tối đa của carousel */
	min-height: 300px; /* Chiều cao tối thiểu của carousel */
	background: no-repeat center center scroll;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

#heroCarousel .carousel-caption {
	bottom: 50%;
	transform: translateY(50%);
}

.partner-logo {
	max-width: 100%;
	height: auto;
	max-height: 100px; /* Điều chỉnh độ cao tối đa cho logo */
}

.carousel-control-prev, .carousel-control-next {
	background-color: transparent;
	border: none;
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-image: none; /* Loại bỏ biểu tượng nền */
}

.booking {
	background: linear-gradient(rgba(15, 23, 43, .7), rgba(15, 23, 43, .7)),
		url('<c:url value="/Template/User/img/booking.jpg" />');
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
}
/*** Team ***/
.team-item {
	box-shadow: 0 0 45px rgba(0, 0, 0, .08);
}

.team-item img {
	transition: .5s;
}

.team-item:hover img {
	transform: scale(1.1);
}

.team-item .btn {
	background: #FFFFFF;
	color: var(--primary);
	border-radius: 20px;
	border-bottom: 1px solid var(--primary);
}

.team-item .btn:hover {
	background: var(--primary);
	color: #FFFFFF;
}

/* CSS để đảm bảo các hình ảnh trong sản phẩm có cùng kích thước */
.equal-height-img {
	height: 100%; /* Chiều cao tối đa */
	width: 100%; /* Chiều rộng tối đa */
	object-fit: cover; /* Hiển thị hình ảnh mà không bị kéo dãn */
}

.service-item {
	box-shadow: 0 0 45px rgba(0, 0, 0, .08);
	transition: .5s;
}

.service-item:hover {
	background: var(--main-color);
}

.service-item * {
	transition: .5s;
}

.service-item:hover * {
	color: var(--light) !important;
}

.product img {
	transition: .5s;
}

.product a:hover img {
	transform: scale(1.1);
}

/* thay đổi kích thước ảnh sản phẩm */
.product-item .card-img-top {
	width: 100%;
	height: 500px; /* Chiều cao cố định */
	object-fit: cover; /* Đảm bảo hình ảnh được căn chỉnh */
}
/* thay đổi kích thước ảnh nhân viên */
.img-team {
	width: 100%;
	height: 300px; /* Adjust height as needed */
	object-fit: cover;
}

.package-item {
	box-shadow: 0 0 45px rgba(0, 0, 0, .08);
}

.package-item img {
	transition: .5s;
}

.package-item .overflow-hidden {
	height: 250px;
}

.package-item .overflow-hidden img {
	width: 100%;
	height: auto;
}

.package-item:hover img {
	transform: scale(1.1);
}

.btn-primary.bg-white {
	color: var(--text-color);
	background-color: var(--primary);
	border-color: #000;
}

.btn-primary.bg-white:hover {
	color: var(--primary);
	background-color: var(--primary);
	border-color: var(--primary);
}
</style>

</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<!-- Carousel -->
	<div id="heroCarousel" class="carousel slide" data-ride="carousel" style="margin-top: 100px">
		<ol class="carousel-indicators">
			<li data-target="#heroCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#heroCarousel" data-slide-to="1"></li>
			<li data-target="#heroCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100"
					src="<c:url value='/Template/User/img/trinh5.webp'/>"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="text-white">Chào Mừng Đến Với Shoes Shop</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="<c:url value='/Template/User/img/trinh6.jpg'/>"
					alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="text-white">Khuyến Mãi Lớn</h1>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100"
					src="<c:url value='/Template/User/img/trinh7.webp'/>"
					alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
					<h1 class="text-white">Sản Phẩm Mới</h1>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#heroCarousel" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#heroCarousel" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<!--Carousel End  -->

	<!-- About Start -->
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row g-5">
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s"
					style="min-height: 400px;">
					<div class="position-relative h-100">
						<video class="position-absolute w-100 h-100" autoplay loop muted
							playsinline>
							<source src="<c:url value='/Template/User/img/about2.mp4'/>"
								type="video/mp4">
							Your browser does not support the video tag.
						</video>
					</div>
				</div>
				<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s" id="about">
					<h2 class="tm-text-primary">Giới thiệu cửa hàng</h2>
					<h1 class="mb-4">
						Welcom to <span class="tm-text-primary">HIUN Store</span>
					</h1>
					<p class="mb-4">Khám phá sản phẩm chất lượng tại cửa hàng trực
						tuyến của chúng tôi và trải nghiệm mua sắm đẳng cấp cùng những ưu
						đãi hấp dẫn. Từ thời trang đến điện tử và đồ gia dụng, chúng tôi
						mang đến những sản phẩm tốt nhất với giá cả cạnh tranh. Hãy bắt
						đầu hành trình mua sắm của bạn ngay hôm nay!</p>

					<div class="row gy-2 gx-4 mb-4">
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right me-2" style="color: aqua;"></i> Sản
								phẩm chất lượng cao
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right me-2" style="color: aqua;"></i> Giao
								hàng nhanh chóng
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right me-2" style="color: aqua;"></i> Hỗ
								trợ khách hàng 24/7
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right me-2" style="color: aqua;"></i> Đổi
								trả dễ dàng
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right me-2" style="color: aqua;"></i> Ưu
								đãi đặc biệt mỗi tuần
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mb-0">
								<i class="fa fa-arrow-right me-2" style="color: aqua;"></i>
								Thanh toán an toàn
							</p>
						</div>
					</div>
					<a class="btn btn-primary py-3 px-5 mt-2 rounded-pill"
						href="#!gioithieu">Đọc thêm</a>
				</div>
			</div>
		</div>
	</div>
	<!-- About End -->

	<!-- Service Start -->
	<div class="container-xxl py-5" id="dichvu">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h2 class="tm-text-primary">Dịch vụ</h2>
				<h1 class="mb-5">Dịch vụ của chúng tôi vô cùng xịn xò</h1>
			</div>
			<div class="row g-4">
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-shopping-bag mb-4"
								style="color: aquamarine;"></i>
							<h5>Mang đến thời trang đẳng cấp</h5>
							<p>Khám phá những xu hướng thời trang mới nhất và độc đáo!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-eye mb-4" style="color: aquamarine;"></i>
							<h5>Dịch vụ tư vấn thời trang</h5>
							<p>Được phục vụ bởi những chuyên gia thời trang hàng đầu!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-user-circle mb-4"
								style="color: aquamarine;"></i>
							<h5>Dịch vụ thay đồ và tư vấn</h5>
							<p>Đội ngũ nhân viên tận tâm, giúp bạn lựa chọn trang phục
								hoàn hảo!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
					<div class="service-item rounded pt-3">
						<div class="p-4">
							<i class="fa fa-3x fa-comments mb-4" style="color: aquamarine;"></i>
							<h5>Dịch vụ chăm sóc khách hàng</h5>
							<p>Hỗ trợ nhanh chóng và chuyên nghiệp, đáp ứng mọi nhu cầu
								của bạn!</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Service End -->



	<!-- Sản phẩm Start -->
	<div class="container-xxl py-5 product" id="sanpham">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h2 class="tm-text-primary">Mặc hàng</h2>
				<h1 class="mb-5">Các mặc hàng phổ biến với giá ưu đãi nhất</h1>
			</div>
			<div class="row g-3">
				<div class="col-lg-7 col-md-6">
					<div class="row g-3">
						<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
							<a class="position-relative d-block overflow-hidden"
								href="product.html"> <img class="img-fluid"
								src="<c:url value='/Template/User/img/trinh1.jpg'/>" alt="">
								<div
									class="bg-white text-danger fw-bold position-absolute top-0 start-0 m-3 py-1 px-2">
									Bông tai hột xoàn | Dior</div>
								<div
									class="bg-white text-primary fw-bold position-absolute bottom-0 end-0 m-3 py-1 px-2">
									250.000.000 VNĐ</div>
							</a>
						</div>
						<div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
							<a class="position-relative d-block overflow-hidden"
								href="product.html"> <img class="img-fluid"
								src="<c:url value='/Template/User/img/trinh3.webp'/>" alt="">
								<div
									class="bg-white text-danger fw-bold position-absolute top-0 start-0 m-3 py-1 px-2">
									Đầm Xẻ Vai | LV</div>
								<div
									class="bg-white text-primary fw-bold position-absolute bottom-0 end-0 m-3 py-1 px-2">
									40.000.000 VNĐ</div>
							</a>
						</div>
						<div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.5s">
							<a class="position-relative d-block overflow-hidden"
								href="product.html"> <img class="img-fluid"
								src="<c:url value='/Template/User/img/trinh4.webp'/>" alt="">
								<div
									class="bg-white text-danger fw-bold position-absolute top-0 start-0 m-3 py-1 px-2">
									Đầm Cách Tân Đa Chi Tiết | Gucci</div>
								<div
									class="bg-white text-primary fw-bold position-absolute bottom-0 end-0 m-3 py-1 px-2">
									800.000.000 VNĐ</div>
							</a>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s"
					style="min-height: 350px;">
					<a class="position-relative d-block h-100 overflow-hidden"
						href="product.html"> <img
						class="img-fluid position-absolute w-100 h-100"
						src="<c:url value='/Template/User/img/trinh2.webp'/>" alt=""
						style="object-fit: cover;">
						<div
							class="bg-white text-danger fw-bold position-absolute top-0 start-0 m-3 py-1 px-2">
							Đầm Win | Chanel</div>
						<div
							class="bg-white text-primary fw-bold position-absolute bottom-0 end-0 m-3 py-1 px-2">
							80.000.000 VNĐ</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Sản phẩm End -->

	<!-- Package Start -->
	<div class="container-fluid tm-container-content">
		<div class="row mb-4">
			<div class="col-12 text-center">
				<h2 class="tm-text-primary">Hàng nghìn sản phẩm phong phú</h2>
				<h1 class="mb-5">Chúng tôi cung cấp đa dạng các sản phẩm chất
					lượng cao.</h1>
			</div>
		</div>

<div class="row tm-gallery">
    <c:forEach items="${products}" var="product">
        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-4">
            <div class="card">
                <img src="<c:url value='/Template/User/img/${product.image}'/>" alt="${product.name}" class="img-fluid">
                <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">Giá: ${product.price} VNĐ</p>
                    <a href="<c:url value='/product?action=view&id=${product.id}'/>" class="btn btn-primary">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </c:forEach>
</div>


		<div class="row mt-4">
			<div class="col-12 d-flex justify-content-center">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li
							class="page-item <c:if test='${currentPage == 1}'>disabled</c:if>">
							<a class="page-link"
							href="<c:url value='/products?page=${currentPage - 1}'/>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a>
						</li>
						<c:forEach begin="1" end="${maxPage}" varStatus="i">
							<li
								class="page-item <c:if test='${currentPage == i.index}'>active</c:if>">
								<a class="page-link"
								href="<c:url value='/products?page=${i.index}'/>">${i.index}</a>
							</li>
						</c:forEach>
						<li
							class="page-item <c:if test='${currentPage == maxPage}'>disabled</c:if>">
							<a class="page-link"
							href="<c:url value='/products?page=${currentPage + 1}'/>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Package End -->

		<!-- Booking Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s"
			id="dathang">
			<div class="container">
				<div class="booking p-5">
					<div class="row g-5 align-items-center">
						<div class="col-md-6 text-white">
							<h1 class="text-white mb-4">Mua sắm trực tuyến</h1>
							<p class="mb-4">Khám phá các sản phẩm đa dạng và phong phú
								của chúng tôi. Từ thời trang, điện tử, đến đồ gia dụng, chúng
								tôi cung cấp tất cả mọi thứ bạn cần. Đặt hàng ngay hôm nay để
								nhận được những ưu đãi đặc biệt!</p>
							<p class="mb-4">Đừng bỏ lỡ cơ hội sở hữu những sản phẩm chất
								lượng với giá ưu đãi nhất. Đặt hàng ngay bây giờ để đảm bảo bạn
								nhận được sản phẩm yêu thích của mình!</p>
							<a class="btn btn-outline-light py-3 px-5 mt-2" href="">Đọc
								thêm</a>
						</div>
						<div class="col-md-6">
							<h1 class="text-white mb-4">Đặt hàng</h1>
							<form>
								<div class="row g-3">
									<div class="col-md-6">
										<div class="form-floating">
											<input type="text" class="form-control bg-transparent"
												id="name" placeholder="Your Name"> <label for="name"
												style="color: white;">Họ và tên</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating">
											<input type="email" class="form-control bg-transparent"
												id="email" placeholder="Your Email"> <label
												for="email" style="color: white;">Email</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating">
											<input type="text" class="form-control bg-transparent"
												id="address" placeholder="Your Address"> <label
												for="address" style="color: white;">Địa chỉ</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating">
											<input type="text" class="form-control bg-transparent"
												id="phone" placeholder="Your Phone Number"> <label
												for="phone" style="color: white;">Số điện thoại</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating">
											<select class="form-select bg-transparent" id="select1">
												<option value="1">Sản phẩm 1</option>
												<option value="2">Sản phẩm 2</option>
												<option value="3">Sản phẩm 3</option>
											</select> <label for="select1" style="color: white;">Chọn sản
												phẩm</label>
										</div>
									</div>
									<div class="col-12">
										<div class="form-floating">
											<textarea class="form-control bg-transparent"
												placeholder="Special Request" id="message"
												style="height: 100px"></textarea>
											<label for="message" style="color: white;">Yêu cầu
												đặc biệt</label>
										</div>
									</div>
									<div class="col-12">
										<button class="btn btn-outline-light w-100 py-3" type="submit">Đặt
											hàng ngay</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Booking End -->

		<!-- Process Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center pb-4 wow fadeInUp" data-wow-delay="0.1s">
					<h2 class="tm-text-primary">Quá trình</h2>
					<h1 class="mb-5">3 bước đơn giản để mua sắm</h1>
				</div>
				<div class="row gy-5 gx-4 justify-content-center">
					<div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp"
						data-wow-delay="0.1s">
						<div
							class="position-relative border border-primary pt-5 pb-4 px-4 "
							style="border-color: aqua !important;">
							<div
								class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow"
								style="width: 100px; height: 100px; background-color: aquamarine !important;">
								<i class="fa fa-search fa-3x text-black"></i>
							</div>
							<h5 class="mt-4">Tìm kiếm sản phẩm</h5>
							<hr class="w-25 mx-auto mb-1"
								style="background-color: aquamarine !important;">
							<hr class="w-50 mx-auto mt-0"
								style="background-color: aquamarine !important;">
							<p class="mb-0">Khám phá hàng ngàn sản phẩm chất lượng cao,
								từ thời trang, điện tử đến đồ gia dụng, tất cả đều có sẵn cho
								bạn.</p>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp"
						data-wow-delay="0.3s">
						<div
							class="position-relative border border-primary pt-5 pb-4 px-4"
							style="border-color: aqua !important;">
							<div
								class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow"
								style="width: 100px; height: 100px; background-color: aquamarine !important;">
								<i class="fa fa-shopping-cart fa-3x text-black"></i>
							</div>
							<h5 class="mt-4">Thêm vào giỏ hàng</h5>
							<hr class="w-25 mx-auto mb-1"
								style="background-color: aquamarine !important;">
							<hr class="w-50 mx-auto mt-0"
								style="background-color: aquamarine !important;">
							<p class="mb-0">Chọn những sản phẩm yêu thích của bạn và thêm
								vào giỏ hàng để chuẩn bị cho quá trình thanh toán dễ dàng và
								tiện lợi.</p>
						</div>
					</div>
					<div class="col-lg-4 col-sm-6 text-center pt-4 wow fadeInUp"
						data-wow-delay="0.5s">
						<div
							class="position-relative border border-primary pt-5 pb-4 px-4"
							style="border-color: aqua !important;">
							<div
								class="d-inline-flex align-items-center justify-content-center bg-primary rounded-circle position-absolute top-0 start-50 translate-middle shadow"
								style="width: 100px; height: 100px; background-color: aquamarine !important;">
								<i class="fa fa-credit-card fa-3x text-black"></i>
							</div>
							<h5 class="mt-4">Thanh toán</h5>
							<hr class="w-25 mx-auto mb-1"
								style="background-color: aquamarine !important;">
							<hr class="w-50 mx-auto mt-0"
								style="background-color: aquamarine !important;">
							<p class="mb-0">Hoàn tất quá trình thanh toán một cách nhanh
								chóng và an toàn để nhận được sản phẩm đã chọn trong thời gian
								sớm nhất.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Process End -->


		<!-- Sản phẩm Start -->
		<div class="container-xxl py-5" id="sanpham">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h2 class="tm-text-primary">Sản phẩm</h2>
					<h1 class="mb-5">Các sản phẩm nổi bật</h1>
				</div>
				<div class="row g-3">
					<div class="col-lg-4 col-md-6 wow fadeInUp package-item"
						data-wow-delay="0.1s">
						<div class="card product-item border-0 shadow">
							<img class="card-img-top img-fluid"
								src="<c:url value='/Template/User/sanpham/sp1.jpg'/>"
								alt="Điện thoại thông minh">
							<div class="card-body text-center ">
								<h5 class="card-title">Đồ 1</h5>
								<p class="card-text">BAZAAR</p>
								<p class="card-text fw-bold">20.000.000 VNĐ</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-sm btn-primary px-3 border-end"
										style="border-radius: 30px 0 0 30px;" href="#!product-detail/{{p.id}}">Xem
										thêm</a> <a href="#!dattour" class="btn btn-sm btn-primary px-3"
										style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp package-item"
						data-wow-delay="0.3s">
						<div class="card product-item border-0 shadow">
							<img class="card-img-top img-fluid "
								src="<c:url value='/Template/User/sanpham/sp2.jpg'/>"
								alt="Laptop cao cấp">
							<div class="card-body text-center">
								<h5 class="card-title">Đồ 2</h5>
								<p class="card-text">ZARA</p>
								<p class="card-text fw-bold">10.000.000 VNĐ</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-sm btn-primary px-3 border-end"
										style="border-radius: 30px 0 0 30px;" href="#!product-detail/{{p.id}}">Xem
										thêm</a> <a href="#!dattour" class="btn btn-sm btn-primary px-3"
										style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp package-item"
						data-wow-delay="0.5s">
						<div class="card product-item border-0 shadow">
							<img class="card-img-top img-fluid "
								src="<c:url value='/Template/User/sanpham/sp3.jpg'/>"
								alt="Máy ảnh chuyên nghiệp">
							<div class="card-body text-center">
								<h5 class="card-title">Đồ 3</h5>
								<p class="card-text">Canon EOS R5</p>
								<p class="card-text fw-bold">$2500</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-sm btn-primary px-3 border-end"
										style="border-radius: 30px 0 0 30px;" href="#!detail/{{p.id}}">Xem
										thêm</a> <a href="#!dattour" class="btn btn-sm btn-primary px-3"
										style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp package-item"
						data-wow-delay="0.7s">
						<div class="card product-item border-0 shadow">
							<img class="card-img-top img-fluid "
								src="<c:url value='/Template/User/sanpham/sp4.jpg'/>"
								alt="Đồng hồ thời trang">
							<div class="card-body text-center">
								<h5 class="card-title">Đồ 4</h5>
								<p class="card-text">Casio G-Shock</p>
								<p class="card-text fw-bold">$300</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-sm btn-primary px-3 border-end"
										style="border-radius: 30px 0 0 30px;" href="#!detail/{{p.id}}">Xem
										thêm</a> <a href="#!dattour" class="btn btn-sm btn-primary px-3"
										style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp package-item"
						data-wow-delay="0.9s">
						<div class="card product-item border-0 shadow">
							<img class="card-img-top img-fluid "
								src="<c:url value='/Template/User/sanpham/sp5.jpg'/>"
								alt="Giày thể thao">
							<div class="card-body text-center">
								<h5 class="card-title">Đồ 5</h5>
								<p class="card-text">Nike Air Max</p>
								<p class="card-text fw-bold">$150</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-sm btn-primary px-3 border-end"
										style="border-radius: 30px 0 0 30px;" href="#!detail/{{p.id}}">Xem
										thêm</a> <a href="#!dattour" class="btn btn-sm btn-primary px-3"
										style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 wow fadeInUp package-item"
						data-wow-delay="1.1s">
						<div class="card product-item border-0 shadow">
							<img class="card-img-top img-fluid "
								src="<c:url value='/Template/User/sanpham/sp6.webp'/>"
								alt="Áo khoác">
							<div class="card-body text-center">
								<h5 class="card-title">Đồ 6</h5>
								<p class="card-text">Zara</p>
								<p class="card-text fw-bold">$80</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-sm btn-primary px-3 border-end"
										style="border-radius: 30px 0 0 30px;" href="#!detail/{{p.id}}">Xem
										thêm</a> <a href="#!dattour" class="btn btn-sm btn-primary px-3"
										style="border-radius: 0 30px 30px 0;">Đặt ngay</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Sản phẩm End -->

		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h2 class="tm-text-primary">Đội ngủ nhân viên xuất sắc</h2>
					<h1 class="mb-5">Trao đổi với đội ngủ nhân viên chuyên sâu.</h1>
				</div>
				<div class="row g-4">
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
						<div class="team-item">
							<div class="overflow-hidden">
								<img class="img-fluid img-team"
									src="<c:url value='/Template/User/logo/CLy.jpg'/>" alt="">
							</div>
							<div class="position-relative d-flex justify-content-center"
								style="margin-top: -19px;">
								<a class="btn btn-square mx-1"
									href="https://www.facebook.com/uabaduong.official"><i
									class="fab fa-facebook-f" style="color: #e52822;"></i></a> <a
									class="btn btn-square mx-1"
									href="https://www.instagram.com/duongph.m/"><i
									class="fab fa-instagram" style="color: #e52822;"></i></a>
							</div>
							<div class="text-center p-4">
								<h6 class="mb-0">LiLi Cute</h6>
								<small>Nhân viên nhiệt huyết và năng lượng</small>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div class="team-item">
							<div class="overflow-hidden">
								<img class="img-fluid img-team"
									src="<c:url value='/Template/User/logo/AChuong.jpg'/>" alt="">
							</div>
							<div class="position-relative d-flex justify-content-center"
								style="margin-top: -19px;">
								<a class="btn btn-square mx-1"
									href="https://www.facebook.com/meo.meo.37669?mibextid=uzlsIk"><i
									class="fab fa-facebook-f" style="color: #e52822;"></i></a> <a
									class="btn btn-square mx-1"
									href="https://www.instagram.com/polaris_1895?igsh=MzRlODBiNWFlZA=="><i
									class="fab fa-instagram" style="color: #e52822;"></i></a>
							</div>
							<div class="text-center p-4">
								<h6 class="mb-0">Vũ Hoàng Chương</h6>
								<small>Nhân viên đáng yêu nhất</small>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
						<div class="team-item">
							<div class="overflow-hidden">
								<img class="img-fluid img-team"
									src="<c:url value='/Template/User/logo/Td.jpg'/>" alt="">
							</div>
							<div class="position-relative d-flex justify-content-center"
								style="margin-top: -19px;">
								<a class="btn btn-square mx-1"
									href="https://www.facebook.com/KhoaiLangThang"><i
									class="fab fa-facebook-f" style="color: #e52822;"></i></a> <a
									class="btn btn-square mx-1"
									href="https://www.instagram.com/khoailangthang?igsh=MzRlODBiNWFlZA=="><i
									class="fab fa-instagram" style="color: #e52822;"></i></a>
							</div>
							<div class="text-center p-4">
								<h6 class="mb-0">Jagat Phạm</h6>
								<small>Vi vu khắp trang web và rồi về bên chúng tôi</small>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
						<div class="team-item">
							<div class="overflow-hidden">
								<img class="img-fluid img-team"
									src="<c:url value='/Template/User/logo/khang.png'/>" alt="">
							</div>
							<div class="position-relative d-flex justify-content-center"
								style="margin-top: -19px;">
								<a class="btn btn-square mx-1"
									href="https://www.facebook.com/trinh.havi"><i
									class="fab fa-facebook-f" style="color: #e52822;"></i></a> <a
									class="btn btn-square mx-1"
									href="https://www.instagram.com/_trinhhavi_?igsh=MzRlODBiNWFlZA=="><i
									class="fab fa-instagram" style="color: #e52822;"></i></a>
							</div>
							<div class="text-center p-4">
								<h6 class="mb-0">Khang Khờ</h6>
								<small>S chỉ là cái cớ, H mới là chính</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Team End -->

		<!-- Đối tác Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="row mt-5 mb-5">
					<div class="col-12 text-center">
						<h2 class="tm-text-primary">Đối tác của chúng tôi</h2>
						<h1 class="mb-5">Chúng tôi hợp tác với các thương hiệu uy tín
							để mang đến cho bạn những sản phẩm chất lượng nhất.</h1>

					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div id="partnerCarousel" class="carousel slide"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="row justify-content-center">
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo1.png'/>"
												class="img-fluid partner-logo" alt="Logo 1">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo2.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 2">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo3.webp'/>"
												class="img-fluid partner-logo" alt="Logo 3">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo4.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 4">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo5.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 5">
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row justify-content-center">
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo6.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 6">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo7.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 7">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo8.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 8">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo9.png'/>"
												class="img-fluid partner-logo" alt="Logo 9">
										</div>
										<div class="col-lg-2 col-md-3 col-4 text-center">
											<img src="<c:url value='/Template/User/logo/logo10.jpg'/>"
												class="img-fluid partner-logo" alt="Logo 10">
										</div>
									</div>
								</div>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#partnerCarousel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#partnerCarousel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Đối tác End -->


	</div>
	<!-- container-fluid, tm-container-content -->

	<%@ include file="/Common/Footer.jsp"%>
	<!-- Bootstrap JS and dependencies -->
	<script src="<c:url value='/Template/User/js/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/Template/User/js/bootstrap.bundle.min.js'/>"></script>



	<script>
		// Chạy carousel tự động
		$('#partnerCarousel').carousel({
			interval : 2000
		// 2 giây
		});
	</script>
</body>
</html>