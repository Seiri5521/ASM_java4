<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

        .navbar-light .navbar-nav .nav-link:hover,
        .navbar-light .navbar-nav .nav-link.active {
            color: var(--main-color) !important;
        }

        .navbar-light .navbar-brand img {
            max-height: 60px;
            transition: .5s;
        }

        .sticky-top.navbar-light .navbar-brand img {
            max-height: 45px;
        }

        @media (max-width: 991.98px) {
            .sticky-top.navbar-light {
                position: relative;
                background: #FFFFFF;
            }
            .navbar-light .navbar-collapse {
                margin-top: 15px;
                border-top: 1px solid #DDDDDD;
            }
            .navbar-light .navbar-nav .nav-link,
            .sticky-top.navbar-light .navbar-nav .nav-link {
                padding: 10px 0;
                margin-left: 0;
                color: var(--dark) !important;
            }
            .navbar-light .navbar-brand img {
                max-height: 45px;
            }
        }

        @media (min-width: 992px) {
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
            .navbar-light .navbar-nav .nav-link:hover::before,
            .navbar-light .navbar-nav .nav-link.active::before {
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
        .navbar-brand {
    display: flex;
    align-items: center;
}


.navbar-brand i {
    font-size: 24px; /* Điều chỉnh kích thước biểu tượng nếu cần */
    margin-right: 10px; /* Khoảng cách giữa biểu tượng và logo */
}

.navbar-brand img {
    max-height: 45px; /* Đảm bảo rằng logo không vượt quá chiều cao này */
    vertical-align: middle; /* Căn chỉnh logo với văn bản */
}

/* Đảm bảo các dropdown menu không hiển thị khi chưa hover */
.nav-item.dropdown:hover .dropdown-menu {
    display: block;
}


/* Định dạng cho dropdown menu */
.dropdown-menu {
    display: none; /* Ẩn menu khi không hover */
    position: absolute;
    top: 100%; /* Hiển thị dưới menu chính */
    left: 0;
    z-index: 1000;
    padding: .5rem 0;
    margin: 0.125rem 0 0;
    font-size: 0.875rem;
    color: #212529;
    background-color: #ffffff;
    border: 1px solid #e5e5e5;
    border-radius: .25rem;

    /* Đặt chiều rộng cố định cho khung dropdown */
    width: 200px;
    overflow: hidden; /* Đảm bảo nội dung không làm cho khung rộng ra */
}

/* Định dạng cho các mục trong dropdown */
.dropdown-item {
    padding: .25rem 1.5rem;
    clear: both;
    font-weight: 400;
    color: #212529;
    text-align: inherit;
    white-space: nowrap;
    background-color: transparent;
    border: 0;
    display: block;
}

/* Thay đổi màu nền khi rê chuột vào mục dropdown */
.dropdown-item:hover {
    background-color: #f8f9fa;
    color: #16181b;
}

/* Định dạng tiêu đề trong dropdown */
.dropdown-header {
    display: block;
    padding: .5rem 1.5rem;
    margin-bottom: 0;
    font-size: .875rem;
    color: #6c757d;
    font-weight: 700; /* Thêm trọng lượng font để tiêu đề nổi bật */
    border-bottom: 1px solid #e5e5e5; /* Đường kẻ dưới tiêu đề */
}

        
    </style>
</head>
<body>


<!-- Navbar Start -->
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top" >
    <div class="container-fluid">
<a class="navbar-brand" href="<c:url value='/index' />">
    <img src="<c:url value='/Template/Admin/dist/img/logo.png'/>" alt="HIUN Shop" style="max-height: 45px; vertical-align: middle;">
</a>

        <div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav mr-auto">
			    <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="womenDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			            NỮ
			        </a>
			        <div class="dropdown-menu" aria-labelledby="womenDropdown">
			            <h6 class="dropdown-header">Sản phẩm</h6>
			            <a class="dropdown-item" href="products">Áo thun</a>
			            <a class="dropdown-item" href="#">Áo len</a>
			            <a class="dropdown-item" href="#">Váy</a>
			            <a class="dropdown-item" href="#">Đầm</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Sản phẩm mới</a>
			            <a class="dropdown-item" href="#">Ưu đãi đặc biệt</a>
			            <a class="dropdown-item" href="#">Bán chạy nhất</a>
			            <a class="dropdown-item" href="#">Theo thương hiệu</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Xem tất cả</a>
			        </div>
			    </li>
			    <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="menDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			            NAM
			        </a>
			        <div class="dropdown-menu" aria-labelledby="menDropdown">
			            <h6 class="dropdown-header">Sản phẩm</h6>
			            <a class="dropdown-item" href="#">Áo thun</a>
			            <a class="dropdown-item" href="#">Áo sơ mi</a>
			            <a class="dropdown-item" href="#">Quần jean</a>
			            <a class="dropdown-item" href="#">Quần kaki</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Sản phẩm mới</a>
			            <a class="dropdown-item" href="#">Ưu đãi đặc biệt</a>
			            <a class="dropdown-item" href="#">Bán chạy nhất</a>
			            <a class="dropdown-item" href="#">Theo thương hiệu</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Xem tất cả</a>
			        </div>
			    </li>
			    <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="kidsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			            TRẺ EM
			        </a>
			        <div class="dropdown-menu" aria-labelledby="kidsDropdown">
			            <h6 class="dropdown-header">Sản phẩm</h6>
			            <a class="dropdown-item" href="#">Áo thun</a>
			            <a class="dropdown-item" href="#">Quần</a>
			            <a class="dropdown-item" href="#">Đầm</a>
			            <a class="dropdown-item" href="#">Váy</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Sản phẩm mới</a>
			            <a class="dropdown-item" href="#">Ưu đãi đặc biệt</a>
			            <a class="dropdown-item" href="#">Bán chạy nhất</a>
			            <a class="dropdown-item" href="#">Theo độ tuổi</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Xem tất cả</a>
			        </div>
			    </li>
			    <li class="nav-item dropdown">
			        <a class="nav-link dropdown-toggle" href="#" id="babiesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			            TRẺ SƠ SINH
			        </a>
			        <div class="dropdown-menu" aria-labelledby="babiesDropdown">
			            <h6 class="dropdown-header">Sản phẩm</h6>
			            <a class="dropdown-item" href="#">Áo sơ sinh</a>
			            <a class="dropdown-item" href="#">Quần sơ sinh</a>
			            <a class="dropdown-item" href="#">Đầm sơ sinh</a>
			            <a class="dropdown-item" href="#">Váy sơ sinh</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Sản phẩm mới</a>
			            <a class="dropdown-item" href="#">Ưu đãi đặc biệt</a>
			            <a class="dropdown-item" href="#">Bán chạy nhất</a>
			            <a class="dropdown-item" href="#">Theo loại sản phẩm</a>
			            <div class="dropdown-divider"></div>
			            <a class="dropdown-item" href="#">Xem tất cả</a>
			        </div>
			    </li>
			</ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="favorites"><i class="fas fa-heart"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="cart"><i class="fas fa-shopping-cart"></i></a>
                </li>
                <c:choose>
                    <c:when test="${not empty sessionScope.currentAccounts}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img src="${sessionScope.currentAccounts.photo}" alt="User Avatar" class="avatar">
                                ${sessionScope.currentAccounts.fullname}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="<c:url value='/profile'/>">Hồ Sơ</a>
                                <a class="dropdown-item" href="contact">Liên Hệ & Trợ Giúp</a>
                                <a class="dropdown-item" href="history">Lịch sử</a>
                                <a class="dropdown-item" href="<c:url value='/orders'/>">Hệ Thống Cửa Hàng</a>
                                <c:if test="${sessionScope.currentAccounts.getAdmin() == true}">
                                    <a class="dropdown-item" href="<c:url value='/admin'/>">Quản Lí Sản Phẩm</a>
                                </c:if>
                                <a class="dropdown-item" data-toggle="modal" data-target="#changePassModal" href="#">Đổi Mật Khẩu</a>
                                <a class="dropdown-item">
                                <small class="me-3 text-black text-end lang-toggle">English</small>
				                <span class="mx-2 text-black">|</span>
				                <small class="text-black text-end lang-toggle">Tiếng Việt</small>
                                
                                </a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="<c:url value='/logout'/>">Đăng Xuất</a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/login'/>"><i class="fas fa-user"></i></a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>
<!-- Navbar End -->

<!-- Modal tìm kiếm -->
<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="searchModalLabel">Tìm Kiếm Sản Phẩm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="text" id="search-input" class="form-control" placeholder="Nhập tên sản phẩm...">
                <button id="search-btn" class="btn btn-primary mt-2">Tìm kiếm</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal đổi mật khẩu -->
<div class="modal fade" id="changePassModal" tabindex="-1" role="dialog" aria-labelledby="changePassModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="changePassModalLabel">Đổi Mật Khẩu</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="changePassword" method="post">
                    <div class="form-group">
                        <label for="current-password">Mật Khẩu Hiện Tại</label>
                        <input type="password" class="form-control" id="current-password" name="currentPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="new-password">Mật Khẩu Mới</label>
                        <input type="password" class="form-control" id="new-password" name="newPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Xác Nhận Mật Khẩu Mới</label>
                        <input type="password" class="form-control" id="confirm-password" name="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Đổi Mật Khẩu</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    // Code JavaScript cho tìm kiếm sản phẩm
    $(document).ready(function() {
        $('#search-btn').on('click', function() {
            var searchTerm = $('#search-input').val();
            window.location.href = 'search?query=' + searchTerm;
        });
    });
</script>
</body>
</html>
