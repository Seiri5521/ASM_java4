<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giỏ hàng</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<!-- Bootstrap CSS -->
<link href="<c:url value='/Template/User/css/bootstrap.min.css'/>" rel="stylesheet">
<style>

    .container {
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .table thead th {
        background-color: #007bff;
        color: #fff;
    }
    .table tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    .table tbody td {
        vertical-align: middle;
    }
    .btn-checkout {
        background-color: #28a745;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
    }
    .btn-checkout:hover {
        background-color: #218838;
    }
    .payment-methods {
        margin-top: 20px;
    }
    .payment-methods label {
        font-weight: bold;
    }
    .payment-methods .form-check {
        margin-bottom: 10px;
    }
</style>
</head>
<body>
    <%@ include file="/Common/Header.jsp"%>
    <div class="container" style="margin-top: 100px;">
        <h2 class="mb-4">Giỏ hàng của bạn</h2>
        <c:choose>
            <c:when test="${not empty sessionScope.cart}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Tên sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${sessionScope.cart}">
                            <tr>
                                <td>${product.name}</td>
                                <td>${product.price} VNĐ</td>
                                <td>1</td>
                                <td>${product.price} VNĐ</td>
                            </tr>
                        </c:forEach>
                        <!-- Add a row for the total amount -->
                        <tr>
                            <td colspan="3" class="text-end"><strong>Tổng cộng:</strong></td>
                            <td>
                                <c:out value="${sessionScope.cartTotal}"/> VNĐ
                            </td>
                        </tr>
                    </tbody>
                </table>
                <form action="processCheckout.jsp" method="post">
                    <div class="payment-methods">
                        <h4>Chọn phương thức thanh toán</h4>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="paymentMethod1" value="creditCard" checked>
                            <label class="form-check-label" for="paymentMethod1">
                                Thanh toán qua thẻ tín dụng
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="paymentMethod2" value="paypal">
                            <label class="form-check-label" for="paymentMethod2">
                                Thanh toán qua PayPal
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="paymentMethod3" value="bankTransfer">
                            <label class="form-check-label" for="paymentMethod3">
                                Chuyển khoản ngân hàng
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="paymentMethod" id="paymentMethod4" value="cod">
                            <label class="form-check-label" for="paymentMethod4">
                                Thanh toán khi nhận hàng (COD)
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-checkout mt-3">Thanh toán</button>
                </form>
            </c:when>
            <c:otherwise>
                <p>Giỏ hàng của bạn đang trống.</p>
            </c:otherwise>
        </c:choose>
    </div>
    <%@ include file="/Common/Footer.jsp"%>
    <!-- Bootstrap JS and dependencies -->
    <script src="<c:url value='/Template/User/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/Template/User/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
