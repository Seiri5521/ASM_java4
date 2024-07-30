<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/Common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - HIUN</title>
    <%@ include file="/Common/fav.jsp"%>
    <%@ include file="/Common/Head.jsp"%>
    <link rel="stylesheet" href="<c:url value='/Template/User/css/styles.css'/>"> <!-- Link to your custom CSS -->
    <style>
        body {
            background: linear-gradient(to right, #f9f9f9, #e0e0e0);
            color: #333;
            font-family: Arial, sans-serif;
        }
        .form-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            margin: 50px auto;
            border: 1px solid #ddd;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group input {
            border-radius: 10px;
            border: 1px solid #ddd;
            padding: 12px;
            width: 100%;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-group input:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.25);
            outline: none;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
            color: #ffffff;
            padding: 12px 20px;
            border-radius: 10px;
            text-transform: uppercase;
            font-weight: bold;
            width: 100%;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .text-center {
            text-align: center;
        }
        h2 {
            color: #007bff;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .form-group input::placeholder {
            color: #6c757d;
            opacity: 1;
        }
        .form-group input:-ms-input-placeholder {
            color: #6c757d;
        }
        .form-group input::-ms-input-placeholder {
            color: #6c757d;
        }
        .form-group p {
            font-size: 14px;
            color: #6c757d;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <%@ include file="/Common/Header.jsp"%>
    <div class="container-fluid">
        <div class="form-container">
            <div class="text-center mb-4">
                <h2 class="tm-text-primary">Đăng nhập</h2>
            </div>
            <form id="login-form" action="login" method="POST">
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="Tên đăng nhập?" required />
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Mật khẩu?" required />
                </div>
                <div class="text-center mb-4">
                    <p>Nếu chưa có tài khoản, vui lòng <a href="<c:url value='/register'/>">Đăng ký</a></p>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </div>
            </form>
        </div>
    </div>
    <%@ include file="/Common/Footer.jsp"%>
</body>
</html>
