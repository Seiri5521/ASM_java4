<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product details</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: white;
}

.container {
	display: flex;
	flex-wrap: wrap;
	margin: 20px;
}

.left-column {
	flex: 1;
	padding-right: 20px;
	border-right: 1px solid #ddd;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.right-column {
	flex: 2;
	padding-left: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.thumbnails {
	display: flex;
	flex-direction: column;
}

.thumbnails img {
	width: 80px;
	margin-bottom: 10px;
	cursor: pointer;
	border: 1px solid #ddd;
}

.main-image img {
	width: 350px;
	height: 500px;
	border: 1px solid #ddd;
}

.product-info {
	padding: 20px 0;
}

.product-info h1 {
	font-size: 24px;
	margin-bottom: 10px;
}

.product-info .price {
	font-size: 20px;
	color: #d0011b;
	margin-bottom: 10px;
}

.colors, .sizes {
	display: flex;
	margin-bottom: 10px;
}

.colors div, .sizes div {
	width: 100%;
	height: 100%;
	cursor: pointer;
	display: flex;
	align-items: center;
}

.colors div.selected, .sizes div.selected {
	border: 2px solid #d0011b;
}

.description {
	margin-top: 20px;
}

.tabs {
	display: flex;
	margin-bottom: 20px;
}

.tabs button {
	flex: 1;
	padding: 10px;
	background-color: #f1f1f1;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

.tabs button.active, .tabs button:hover {
	background-color: #ddd;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
}

.header, .footer {
	width: 100%;
	text-align: center;
	padding: 10px 0;
	background-color: #f1f1f1;
}

.product-list {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.product-item {
	flex: 1 1 30%;
	box-sizing: border-box;
	margin: 10px;
	text-align: center;
}

.product-item img {
	width: 100%;
	height: auto;
}

.product-item h3 {
	font-size: 18px;
	margin: 10px 0 5px;
}

.product-item p {
	font-size: 16px;
	color: #d0011b;
}
</style>
<script>
    function changeImage(src) {
        document.getElementById("mainImage").src = src;
    }

    function showTab(evt, tabName) {
        var i, tabContent, tabLinks;
        tabContent = document.getElementsByClassName("tab-content");
        for (i = 0; i < tabContent.length; i++) {
            tabContent[i].style.display = "none";
        }
        tabLinks = document.getElementsByClassName("tab-link");
        for (i = 0; i < tabLinks.length; i++) {
            tabLinks[i].className = tabLinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementsByClassName('tab-link')[0].click();
    });
</script>
</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<h1 class="card-title">${product.name}</h1>
			<p class="card-text">Giá: ${product.price} VNĐ</p>
			<div class="left-column col-3">
				<div class="thumbnails">
					<img src="<c:url value='/Template/User/sanpham/sp1.jpg'/>"
						alt="Thumbnail 1"
						onclick="changeImage('<c:url value='/Template/User/sanpham/sp1.jpg'/>')">
					<img src="<c:url value='/Template/User/sanpham/sp2.jpg'/>"
						alt="Thumbnail 2"
						onclick="changeImage('<c:url value='/Template/User/sanpham/sp2.jpg'/>')">
					<img src="<c:url value='/Template/User/sanpham/sp3.jpg'/>"
						alt="Thumbnail 3"
						onclick="changeImage('<c:url value='/Template/User/sanpham/sp3.jpg'/>')">
					<img src="<c:url value='/Template/User/sanpham/sp4.jpg'/>"
						alt="Thumbnail 4"
						onclick="changeImage('<c:url value='/Template/User/sanpham/sp4.jpg'/>')">
				</div>
			</div>
			<div class="main-image col-9">
				<img id="mainImage"
					src="<c:url value='/Template/User/sanpham/sp1.jpg'/>"
					alt="Main Image">
			</div>
		</div>
		<div class="container">
			<div class="right-column">
				<div class="product-info">
					<!-- Phần lựa chọn màu sắc -->
					<div class="colors">
						<span>Chọn màu:</span>
						<div style="display: flex; gap: 50px; margin-top: 5px;">
							<div
								style="background-color: #000; width: 20px; height: 20px; border-radius: 50%; cursor: pointer;"
								class="color-option selected"></div>
							<div
								style="background-color: #fff; width: 20px; height: 20px; border-radius: 50%; cursor: pointer;"
								class="color-option"></div>
							<div
								style="background-color: #ccc; width: 20px; height: 20px; border-radius: 50%; cursor: pointer;"
								class="color-option"></div>
							<div
								style="background-color: #000080; width: 20px; height: 20px; border-radius: 50%; cursor: pointer;"
								class="color-option"></div>
							<div
								style="background-color: #ff69b4; width: 20px; height: 20px; border-radius: 50%; cursor: pointer;"
								class="color-option"></div>
						</div>
					</div>

					<!-- Phần lựa chọn kích thước -->
					<div class="sizes" style="margin-top: 10px;">
						<span>Chọn kích thước:</span>
						<div style="display: flex; gap: 5px; margin-top: 5px;">
							<div class="size-option selected"
								style="padding: 5px 10px; border: 1px solid #000; cursor: pointer;">S</div>
							<div class="size-option"
								style="padding: 5px 10px; border: 1px solid #000; cursor: pointer;">M</div>
							<div class="size-option"
								style="padding: 5px 10px; border: 1px solid #000; cursor: pointer;">L</div>
							<div class="size-option"
								style="padding: 5px 10px; border: 1px solid #000; cursor: pointer;">XL</div>
							<div class="size-option"
								style="padding: 5px 10px; border: 1px solid #000; cursor: pointer;">XXL</div>
						</div>
					</div>

					<!-- Form để thêm sản phẩm vào giỏ hàng -->
					<%-- 					<form action="cart.jsp" method="post" style="margin-top: 10px;">
						<input type="hidden" name="productId" value="${product.id}">
						<input type="hidden" name="quantity" value="1">
						<!-- Có thể thay đổi nếu cần -->
						<a href="cart" class="btn btn-danger">Thêm sản phẩm</a>
					</form> --%>
					<form action="addCart" method="post" style="margin-top: 10px;">
						<input type="hidden" name="productId" value="${product.id}">
						<input type="number" name="quantity" value="1" placeholder="1" min="1">
						<button type="submit" class="btn btn-danger">Thêm sản phẩm</button>
					</form>

				</div>


				<div class="tabs">
					<button class="tab-link" onclick="showTab(event, 'details')">Chi
						tiết</button>
					<button class="tab-link" onclick="showTab(event, 'care')">Chất
						liệu / Cách chăm sóc</button>
				</div>
				<div id="details" class="tab-content">
					<h2>Chi tiết</h2>
					<p>Váy dạ hội cao cấp thiết kế sang trọng, quý phái, phù hợp
						cho các buổi tiệc tối, dạ hội hoặc các sự kiện quan trọng. Chất
						liệu mềm mại, thoải mái, mang lại sự tự tin và quyến rũ cho người
						mặc.</p>
					<ul>
						<li>Chất liệu: Lụa cao cấp kết hợp ren tinh tế</li>
						<li>Màu sắc: Đỏ rượu vang</li>
						<li>Kích thước: S, M, L, XL</li>
						<li>Kiểu dáng: Dài chấm gót, xòe rộng, tay lửng</li>
						<li>Chiều dài váy: 150 cm</li>
						<li>Đường may: Chỉn chu, tỉ mỉ từng chi tiết</li>
						<li>Phụ kiện đi kèm: Không</li>
					</ul>
				</div>
				<div id="care" class="tab-content">
					<h2>Chất liệu / Cách chăm sóc</h2>
					<p>
						<strong>Chất liệu:</strong> Lụa cao cấp kết hợp với ren tinh tế,
						tạo nên sự mềm mại và thoải mái khi mặc.
					</p>
					<p>
						<strong>Hướng dẫn bảo quản:</strong>
					</p>
					<ul>
						<li>Giặt tay nhẹ nhàng với nước lạnh</li>
						<li>Không sử dụng chất tẩy mạnh</li>
						<li>Ủi ở nhiệt độ thấp</li>
						<li>Tránh phơi trực tiếp dưới ánh nắng mặt trời</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
									style="border-radius: 30px 0 0 30px;"
									href="#!product-detail/{{p.id}}">Xem thêm</a> <a
									href="#!dattour" class="btn btn-sm btn-primary px-3"
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
									style="border-radius: 30px 0 0 30px;"
									href="#!product-detail/{{p.id}}">Xem thêm</a> <a
									href="#!dattour" class="btn btn-sm btn-primary px-3"
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

	<%@ include file="/Common/Footer.jsp"%>
	<!-- Bootstrap JS and dependencies -->
	<script src="<c:url value='/Template/User/js/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/Template/User/js/bootstrap.bundle.min.js'/>"></script>


</body>
</html>
