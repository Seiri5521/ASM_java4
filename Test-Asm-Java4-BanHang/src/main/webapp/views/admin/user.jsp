<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>QUẢN LÝ NHÂN VIÊN</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            padding: 0;
            text-align: center;
            background: #FFFBEB;
        }
        h1 {
            margin-top: 5%;
            margin-bottom: 2%;
            color: #251749;
        }
        .div_form {
            width: 40%;
            margin-left: auto;
            margin-right: auto;
            color: #263159;
        }
        .input-group-text, .form-control {
            color: #263159;
        }
        .div_role {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .div_role > input, .div_role > label {
            margin-left: 0.3rem;
        }
        .table {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
        .alert {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
        a {
            color: #263159;
            margin-left: 0.2rem;
        }
        .delete {
            color: #DC3535;
        }
    </style>
</head>
<body>
    <h1>QUẢN LÝ NHÂN VIÊN</h1>
    <div class="alert">
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
    </div>
    <form class="div_form" action="/Test-Asm-Java4/admin/user.jsp" method="post">
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Username</span>
            <input name="username" type="text" class="form-control" value="${user.username}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Password</span>
            <input name="password" type="password" class="form-control" value="${user.password}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Họ và Tên</span>
            <input name="fullname" type="text" class="form-control" value="${user.fullname}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
            <input name="email" type="email" class="form-control" value="${user.email}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        <div class="input-group mb-3">
            <span class="input-group-text" id="inputGroup-sizing-default">Hình Ảnh</span>
            <input name="photo" type="text" class="form-control" value="${user.photo}" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
        </div>
        <div class="div_role">
            <label for="admin">Vai trò:</label>
            <input id="admin" type="radio" name="admin" ${user.admin?'checked':''} aria-label="Sizing example input"> 
            <label for="admin">Admin</label>
            <input id="user" type="radio" name="admin" ${user.admin?'':'checked'} aria-label="Sizing example input"> 
            <label for="user">Nhân viên</label>
        </div>
        <div class="d-flex justify-content-center mt-3">
            <button formaction="/Test-Asm-Java4/admin/create" class="btn btn-outline-success mx-2">Thêm</button>
            <button formaction="/Test-Asm-Java4/admin/update" class="btn btn-outline-warning mx-2">Cập nhật</button>
            <button formaction="/Test-Asm-Java4/admin/delete" class="btn btn-outline-danger mx-2">Xóa</button>
            <button formaction="/Test-Asm-Java4/admin/reset" class="btn btn-outline-info mx-2">Reset</button>
        </div>
    </form>
    <table class="table table-hover mt-5">
        <thead class="table-dark">
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Password</th>
                <th scope="col">Họ và Tên</th>
                <th scope="col">Email</th>
                <th scope="col">Hình ảnh</th>
                <th scope="col">Vai trò</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.fullname}</td>
                    <td>${user.email}</td>
                    <td>${user.photo}</td>
                    <td>${user.admin ? 'Admin' : 'User'}</td>
                    <td>
                        <a href="/Test-Asm-Java4/admin/edit/?username=${user.username}" class="btn btn-sm btn-primary">Edit</a>
                        <a class="delete btn btn-sm btn-danger text-black" href="/Test-Asm-Java4/admin/delete/?username=${user.username}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
