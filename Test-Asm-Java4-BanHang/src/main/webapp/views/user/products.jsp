<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Products</title>
<%@ include file="/Common/fav.jsp"%>
<%@ include file="/Common/Head.jsp"%>
<!-- Bootstrap CSS -->
<link href="<c:url value='/Template/User/css/bootstrap.min.css'/>"
	rel="stylesheet">
<style>
</style>
</head>
<body>
	<%@ include file="/Common/Header.jsp"%>
	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<c:forEach items="${products}" var="product">
				<div class="col-sm-3 mb-3 mb-sm-0 py-2">
					<div class="card">
						<div class="card-body">
							<img src="<c:url value='/Template/User/img/${product.image}'/>"
								alt="${product.name}" class="img-fluid">
							<h5 class="card-title">${product.name}</h5>
							<p class="card-text">Giá: ${product.price} VNĐ</p>
							<a href="<c:url value='/product?action=view&id=${product.id}'/>"
								class="btn btn-primary">Xem chi tiết</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="/Common/Footer.jsp"%>
	<!-- Bootstrap JS and dependencies -->
	<script src="<c:url value='/Template/User/js/jquery.min.js'/>"></script>
	<script
		src="<c:url value='/Template/User/js/bootstrap.bundle.min.js'/>"></script>
</body>
</html>
