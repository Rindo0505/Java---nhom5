<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Đăng nhập hệ thống</title>
    <link href="style.css" rel="stylesheet" />
</head>
<body>
    <div class="hitec-signin">                
        <div class="hitec-col-image text-center">
            <div class="hitec-signin-logo">
                <a href="https://ums.husc.edu.vn"><img src="Logo-ko-nen.png" alt=""></a>
            </div>
            <div class="hitec-signin-image">
                <img src="image1.png" alt="">
            </div>
        </div>
        <div class="hitec-col-signin">
            <form action="/Account/Login" method="post" class="hitec-form-signin">
                <img src="logo-small.png" alt="">
                <h2 class="form-signin-heading">SINH VIÊN</h2>
                <div class="form-group">
                    <label for="loginID" 
                        style=  "display: inline-block;
                                font-size: 14px;
                                margin-bottom: 7px;
                                font-family: arial;
                                font-weight: bold;"> 
                            Mã sinh viên:
                    </label>
                    <input type="text" id="loginID" name="loginID" class="form-control input-lg"
                    style=" width: 255px;
                            padding: 9px 12px;
                            font-size: 15px;
                            border-color: #66afe9;
                            border: 1px solid #ccc;
                            border-radius: 4px;
                            margin-bottom: 12px;"
                    placeholder="Mã sinh viên" required autofocus value="" />
                </div>
                <div class="form-group">
                    <label for="password"
                    style=  "display: inline-block;
                                font-size: 14px;
                                margin-bottom: 7px;
                                font-family: arial;
                                font-weight: bold;">Mật khẩu:</label>
                    <input type="password" id="password" name="password" class="form-control input-lg" 
                    style=" width: 255px;
                            padding: 9px 12px;
                            font-size: 15px;
                            border-color: #66afe9;
                            border: 1px solid #ccc;
                            border-radius: 4px;
                            margin-bottom: 6px;"
                    placeholder="Mật khẩu" required value="" />
                </div>
                <div class="form-group">
                    <span class="text-danger"></span>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-custom" type="submit">Đăng nhập</button>
            </form>
        </div>        
    </div>    
    <footer>
        <div class="row">
            <div class="col-xs-12 text-center nopadding">
                <p><a href="http://husc.edu.vn" 
                    style="color:#fff;
                    text-decoration: none; 
                    font-family: arial; 
                    font-size: 14px;" target="_blank">Trường Đại học Khoa học, Đại học Huế</a></p>
                <p><span class="glyphicon glyphicon-home"></span> 77 Nguyễn Huệ, Thành phố Huế, Tỉnh Thừa Thiên Huế, Việt Nam</p>
                <p><span class="glyphicon glyphicon-phone"></span> Điện thoại: (+84) 0234.3823290 – Fax: (+84) 0234.3824901</p>                
            </div>
        </div>
    </footer>
    <script src="/Scripts/jquery-1.10.2.min.js"></script>
    <script src="/Scripts/bootstrap.min.js"></script>
</body>
</html>