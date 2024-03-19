<%-- 
    Document   : home
    Created on : Mar 18, 2024, 9:18:56 AM
    Author     : Vu Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student's Home</title>
        <style>
            .container_header {
                display: flex; /* Sử dụng flexbox để căn chỉnh */
                justify-content: space-between; /* Căn đều các phần tử con */
                align-items: center; /* Căn giữa theo chiều dọc */
                padding: 10px; /* Thêm padding để tạo khoảng cách */
                border: 1px solid #ccc; /* Đặt đường viền cho khung */
                padding: 10px; /* Thêm padding để tạo khoảng cách giữa khung và nội dung */
                margin-bottom: 50px; /* Thêm margin để tạo khoảng cách giữa các khung */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */
            }
            .footer {
                border: 1px solid #ccc; /* Đặt đường viền cho khung */
                padding: 10px; /* Thêm padding để tạo khoảng cách giữa khung và nội dung */
                margin-bottom: 20px; /* Thêm margin để tạo khoảng cách giữa các khung */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */
                margin-top: 330px
            }

        </style>
        <script>
            function logout() {
                window.location.href = "../logout";
            }
        </script>
    </head>
    <body>
        <div class="container_header">
            <a href="home?id=${requestScope.sID}">
                <img src="../images/FPT_Education_logo.svg.png" alt="Logo_FPT" style="width:250px; height: 100px;">
            </a> 
            <h1 class="title">Student's Home</h1>
            <div style="width: 250px; display: flex; ">
                <div style="background-color: green; color: white; padding: 5px; margin-right: 10px; border-radius: 5px ">
                    <a href="profile?id=${requestScope.sID}" style="text-decoration: none; color: white;">
                        ${requestScope.coreName}
                    </a>
                </div>
                <div style="border-left: 1px solid black; margin-right: 10px;"></div>
                <input style="background-color: green; color: white; border-radius: 5px;padding: 5px;"  type="button" value="Log out" onclick="logout()">
            </div>
        </div>

        <div style="display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <button class="action-button" onclick="location.href = 'grade?id=${requestScope.sID}'" style="color:white; min-width: 50%; background-color: darkorange; margin-bottom: 10px;">
                <h3>Student's score</h3>
            </button>
            <button class="action-button" onclick="location.href = 'attendstudent?id=${requestScope.sID}'" style="color:white; min-width: 50%; background-color: darkorange">
                <h3>Student's Attendance</h3>
            </button>
        </div>


        <div class="footer">
            <p style="text-align: center">Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ sinh viên: Email: <b>dichvusinhvien@fe.edu.vn</b>. Điện thoại: (024)7308.13.13</p>
        </div>
    </body>
</html>
