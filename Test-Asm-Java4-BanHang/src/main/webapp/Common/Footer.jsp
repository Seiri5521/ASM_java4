<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .tm-social-links a {
        text-decoration: none;
        color: inherit;
    }
    .tm-social-links .fa-facebook {
        color: #3b5998; /* Màu xanh Facebook */
    }
    .tm-social-links .fa-twitter {
        color: #1da1f2; /* Màu xanh Twitter */
    }
    .tm-social-links .fa-instagram {
        color: #c32aa3; /* Màu tím Instagram */
    }
    .tm-social-links .fa-pinterest {
        color: #bd081c; /* Màu đỏ Pinterest */
    }
</style>


<footer class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h4 class="tm-text-primary mb-4 tm-footer-title">Công ty</h4>
                <ul class="tm-footer-links pl-0">
	               <li> <a href="">Về chúng tôi</a> </li> <br>
	               <li> <a href="">Liên hệ</a> </li> <br>
	               <li> <a href="">Chính sách bảo mật</a> </li> <br>
	               <li> <a href="">Điều khoản & Điều kiện</a> </li> <br>
	               <li> <a href="">FAQs & Trợ giúp</a> </li> <br>
                </ul>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="tm-text-primary mb-4 tm-footer-title">Liên hệ</h4>
                <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i> QTSC 9 Building, Tô Ký, Tân
                    Chánh Hiệp, Quận 12, TP Hồ Chí Minh</p>
                <p class="mb-2"><i class="fa fa-phone-alt me-3"></i> 0773377107</p>
                <p class="mb-2"><i class="fa fa-envelope me-3"></i> HIUNShop@gmail.com.vn</p>
             <div class="d-flex pt-2">
                <ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
                    <li class=""><a href="https://facebook.com"><i class="fab fa-facebook"></i></a></li>
                    <li class=""><a href="https://twitter.com"><i class="fab fa-twitter"></i></a></li>
                    <li class=""><a href="https://instagram.com"><i class="fab fa-instagram"></i></a></li>
                    <li class=""><a href="https://pinterest.com"><i class="fab fa-pinterest"></i></a></li>
                </ul>
            </div>
            </div>
            
            <div class="col-lg-3 col-md-6">
                <h4 class="tm-text-primary mb-4 tm-footer-title">Phòng trưng bày</h4>
                <div class="row g-2 pt-2">
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="<c:url value='/Template/User/logo/logo10.jpg'/>" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="<c:url value='/Template/User/logo/logo10.jpg'/>" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="<c:url value='/Template/User/logo/logo10.jpg'/>" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="<c:url value='/Template/User/logo/logo10.jpg'/>" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="<c:url value='/Template/User/logo/logo10.jpg'/>" alt="">
                    </div>
                    <div class="col-4">
                        <img class="img-fluid bg-light p-1" src="<c:url value='/Template/User/logo/logo10.jpg'/>" alt="">
                    </div>
                </div>
            </div>
    
            <div class="col-lg-3 col-md-6">
                <h4 class="tm-text-primary mb-4 tm-footer-title">Bản tin</h4>
                <p>Hãy đăng nhập vào thế giới của chúng tôi và những món quà sẽ đến với bạn.</p>
                <div class="position-relative mx-auto" style="max-width: 400px;">
                    <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text"
                        placeholder="Email">
                    <button type="button"
                        class="btn btn-primary py-2 position-absolute top-0 end-0 me-2" style="margin-top: 80px">Đăng
                        nhập</button> <br> <br>
                </div>
            </div>
    
    
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <h4 class="tm-text-primary mb-4 tm-footer-title">Được chứng nhận</h4>
                    <div class="">
                        <a href=""><img class="img-fluid" alt="Bộ công thương" title=""
                                src="<c:url value='/Template/User/logo/bocongthuong.png'/>" width="130"></a>
                        <a href=""><img class="img-fluid" src="<c:url value='/Template/User/logo/IATAlogo.png'/>" alt="IATA" width="70"></a>
                    </div>
                </div> <br>
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex flex-column align-items-center">
                        <img src="<c:url value='/Template/User/logo/tmg.png'/>" title="Đại lý du lịch hàng đầu Việt Nam" width="70"> <br>
                        <span style="color: white;">Đại Lý Thời Trang Trực tuyến Hàng đầu Việt Nam</span>
                    </div>
                </div> <br>
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex flex-column align-items-center">
                        <img src="<c:url value='/Template/User/logo/victoria.jpg'/>" title="Best Companies to Work for in Asia" width="70">
                        <br>
                        <span style="color: white;">Best Fashion Companies to Work for in Asia</span>
                    </div>
                </div> <br>
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex flex-column align-items-center">
                        <img src="<c:url value='/Template/User/logo/asia.jpg'/>" title="APEA Inspirational Brand Award" width="25"> <br>
                        <span style="color: white;">APEA Fashion Brand Inspiration Award</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &#xAE; <a class="border-bottom" href="#">HIUN</a>, All Right Reserved.
    
    
                    Designed By <a class="border-bottom" href="#">RonPham</a>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="footer-menu">
                        <a href="" style="margin-right: 5px;">Trang chủ</a>
                        <a href="" style="margin-right: 5px">Cookies</a>
                        <a href="" style="margin-right: 5px">Trợ giúp</a>
                        <a href="">FQAs</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
        <!-- Back to Top -->

<script src="<c:url value='/Template/User/js/plugins.js'/>"></script>
<script>
    $(window).on("load", function() {
        $('body').addClass('loaded');
    });

    $('#changePassBtn').click(function () {
        $('#messageChangePass').text('');
        var currentPass = $('#currentPass').val();
        var newPass = $('#newPass').val();
        var formData = {
            'currentPass': currentPass,
            'newPass': newPass
        };
        $.ajax({
            url: 'changePass',
            type: 'POST',
            data: formData
        }).then(function(data) {
            $('#messageChangePass').text("Mật khẩu đã được thay đổi!!");
        }).fail(function(error) {
            $('#messageChangePass').text("LỖI!, Vui lòng kiểm tra thông tin của bạn!!");
        });
    });
</script>
