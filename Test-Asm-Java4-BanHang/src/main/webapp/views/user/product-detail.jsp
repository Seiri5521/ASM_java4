<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name}</title>
    <%@ include file="/Common/fav.jsp"%>
    <%@ include file="/Common/Head.jsp"%>
    <style>
        body {
            background-color: #f8f9fa;
            color: #212529;
        }
        .product-details {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .product-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .product-description {
            margin-top: 20px;
        }
        .btn-action {
            margin-top: 10px;
        }
        .product-specifications, .product-reviews {
            background-color: #f1f1f1;
            padding: 15px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .product-reviews {
            margin-top: 30px;
        }
        .review-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .review-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <%@ include file="/Common/Header.jsp"%>
    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4 text-center">
            <h2 class="col-12 tm-text-primary">${product.name}</h2>
        </div>
        <div class="row tm-mb-90">
            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12">
                <img src="<c:url value='/Template/User/img/${product.image}'/>" alt="${product.name}" class="product-image">
            </div>
            <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 product-details">
                <h3 class="tm-text-gray-dark mb-3">Thông tin sản phẩm</h3>
                <p><strong>Giá:</strong> ${product.price} VNĐ</p>
                <p><strong>Danh mục:</strong> ${product.categoryId}</p>
                <p><strong>Ngày tạo:</strong> ${product.createDate}</p>
                <%-- <p class="product-description">${product.description}</p> --%>
                <div class="text-center btn-action">
                    <a href="cart?action=add&id=${product.id}" class="btn btn-primary tm-btn-big">Thêm vào giỏ hàng</a>
                </div>
                <c:if test="${not empty sessionScope.currentAccounts}">
                    <div class="text-center btn-action">
                        <button id="likeOrUnlikeBtn" class="btn btn-secondary tm-btn-big">
                            <c:choose>
                                <c:when test="${flagLikedBtn == true}">
                                    Không thích
                                </c:when>
                                <c:otherwise>Thích</c:otherwise>
                            </c:choose>
                        </button>
                    </div>
                </c:if>
            </div>
        </div>

        <%-- <div class="row">
            <div class="col-12 product-specifications">
                <h3 class="tm-text-gray-dark mb-3">Thông số kỹ thuật</h3>
                <ul>
                    <li><strong>Kích thước:</strong> ${product.dimensions}</li>
                    <li><strong>Trọng lượng:</strong> ${product.weight}</li>
                    <li><strong>Chất liệu:</strong> ${product.material}</li>
                    <li><strong>Màu sắc:</strong> ${product.color}</li>
                </ul>
            </div>
        </div>
 --%>
        <div class="row">
            <div class="col-12 product-reviews">
                <h3 class="tm-text-gray-dark mb-3">Đánh giá sản phẩm</h3>
                <div class="review-item">
                    <p><strong>Người dùng A:</strong> Rất hài lòng với sản phẩm này!</p>
                    <p>⭐️⭐️⭐️⭐️⭐️</p>
                </div>
                <div class="review-item">
                    <p><strong>Người dùng B:</strong> Sản phẩm tốt, nhưng giao hàng hơi chậm.</p>
                    <p>⭐️⭐️⭐️⭐️</p>
                </div>
                <div class="review-item">
                    <p><strong>Người dùng C:</strong> Đã mua lần thứ hai, chất lượng vẫn tốt như lần đầu.</p>
                    <p>⭐️⭐️⭐️⭐️⭐️</p>
                </div>
                <!-- Thêm đánh giá khác nếu cần -->
            </div>
        </div>
    </div>
    <!-- container-fluid, tm-container-content -->

    <%@ include file="/Common/Footer.jsp"%>

    <!-- jQuery -->
    <script src="<c:url value='/Template/User/plugins/jquery/jquery.min.js'/>"></script>
    <!-- Xử lý like/unlike -->
    <script>
        $('#likeOrUnlikeBtn').click(function () {
            var productId = '${product.id}';
            $.ajax({
                url: 'product',
                method: 'POST',
                data: {
                    action: 'like',
                    id: productId
                }
            }).done(function(data) {
                var text = $('#likeOrUnlikeBtn').text();
                if (text.includes('Thích')) {
                    $('#likeOrUnlikeBtn').text('Không thích');
                } else {
                    $('#likeOrUnlikeBtn').text('Thích');
                }
            }).fail(function (error) {
                alert('Vui lòng thử lại! Hệ thống đã bị lỗi!');
            });
        });
    </script>
</body>
</html>
