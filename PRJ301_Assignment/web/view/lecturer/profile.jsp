<%-- 
    Document   : profile
    Created on : Mar 19, 2024, 3:44:50 PM
    Author     : Vu Minh Quan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

            .container {
                display: flex;
                justify-content: center; /* Căn giữa theo chiều ngang */
            }
            table {
                border-collapse: collapse; /* Gộp các border của ô lại với nhau */
                width: 80%; /* Độ rộng của bảng */
                margin: 0 auto; /* Đưa bảng ra giữa */
                text-align: center; /* Căn giữa nội dung của bảng */
            }
            th, td {
                border-bottom:  1px solid #ccc; /* Đặt border cho các ô */
                padding: 8px; /* Thêm padding cho các ô */
                text-align: left; /* Căn text sang trái */
            }
            th {
                background-color: #f2f2f2; /* Màu nền cho tiêu đề */
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
            <a href="timetable?id=${requestScope.coreName}">
                <img src="../images/FPT_Education_logo.svg.png" alt="Logo_FPT" style="width:250px; height: 100px;">
            </a> 
            <h1 class="title">Lecturer's profile</h1>
            <div style="width: 250px; display: flex; ">
                <div style="background-color: green; color: white; padding: 5px; margin-right: 10px; border-radius: 5px ">
                    <a href="profile?id=${requestScope.coreName}" style="text-decoration: none; color: white;">
                        ${requestScope.coreName}
                    </a>

                </div>
                <div style="border-left: 1px solid black; margin-right: 10px;"></div>
                <input style="background-color: green; color: white; border-radius: 5px;padding: 5px;"  type="button" value="Log out" onclick="logout()">
            </div>
        </div>

        <table>

            
            <c:forEach items="${requestScope.arrLecturer}" var="lec">
                <tr>
                    <td>
                        <b>Login</b>
                    </td>
                    <td>
                        ${requestScope.coreName}
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Full name</b>
                    </td>
                    <td>                                       
                        ${lec.lName}
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Image</b>
                    </td>
                    <td>
                        <img src="" style="height:150px;width:120px;border-width:0px;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Email</b>
                    </td>
                    <td>${lec.gmail}</td>
                </tr>
            </c:forEach>

        </table>
    </body>
</html>
