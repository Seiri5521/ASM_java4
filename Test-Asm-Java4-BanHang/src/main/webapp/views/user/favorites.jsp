<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm bán hàng - HIUN</title>
    <%@ include file="/Common/fav.jsp"%>
    <%@ include file="/Common/Head.jsp"%>
    <link rel="stylesheet" href="<c:url value='/Template/User/css/styles.css'/>"> <!-- Link to your custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .product-item {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .product-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .product-image img {
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            width: 100%;
            height: auto;
        }
        .product-details {
            padding: 15px;
        }
        .product-title {
            font-size: 1.2rem;
            margin-bottom: 10px;
            color: #333;
        }
        .product-price {
            font-size: 1.1rem;
            color: #28a745;
            margin-bottom: 15px;
        }
        .product-button {
            display: block;
            width: 100%;
            text-align: center;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            text-transform: uppercase;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .product-button:hover {
            background-color: #0056b3;
        }
        .container-fluid {
            padding: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="/Common/Header.jsp"%>

    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-12 tm-text-primary text-center">Danh sách sản phẩm</h2>
        </div>
        <div class="row tm-mb-90">
            <c:forEach items="${products}" var="product">
                <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                    <div class="product-item">
                        <div class="product-image">
                            <img src="<c:url value='${product.image}'/>" alt="${product.name}">
                        </div>
                        <div class="product-details">
                            <h5 class="product-title">${product.name}</h5>
                            <p class="product-price">${product.price} VNĐ</p>
                            <a href="<c:url value='/product?action=view&id=${product.id}'/>" class="product-button">Xem chi tiết</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <%@ include file="/Common/Footer.jsp"%>
</body>
</html>
