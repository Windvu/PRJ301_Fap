<%-- 
    Document   : attendStudent
    Created on : Mar 17, 2024, 9:12:18 PM
    Author     : Vu Minh Quan
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student's attendance</title>
        <style>


            .container {
                width: 80%; /* Độ rộng của khung chứa */
                margin: auto; /* Canh giữa khung chứa */
                text-align: center; /* Canh giữa nội dung bên trong */
            }

            table {
                width: 100%; /* Bảng sẽ chiếm toàn bộ độ rộng của khung chứa */
                border-collapse: collapse; /* Gộp đường viền của các ô */
                margin-top: 20px; /* Khoảng cách từ bảng đến các phần tử phía trên */
                border: 1px solid black; /* Đường viền cho bảng */
            }

            th, td {
                border: 1px solid black; /* Đặt đường viền cho các ô */
                padding: 8px; /* Thêm padding vào các ô */
            }

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
                margin-top: 250px;
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */
            }

            .note{
                margin-left: 30px;
                margin-bottom: 30px;
                position: relative; /* Thiết lập vị trí của phần tử */
                top: 200px; /* Dịch chuyển phần tử xuống phía dưới 50px */
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
            <h1 class="title">Student's attendance</h1>
            <div style="width: 250px; display: flex; ">

                <div style="background-color: green; color: white; padding: 5px; margin-right: 10px; border-radius: 5px ">
                    <a href="profile?id=${requestScope.ID}" style="text-decoration: none; color: white;">
                        ${requestScope.coreName}
                    </a>
                </div>
                <div style="border-left: 1px solid black; margin-right: 10px;"></div>
                <input style="background-color: green; color: white; border-radius: 5px;padding: 5px;"  type="button" value="Log out" onclick="logout()">
            </div>
        </div>

        <div style="margin-left: 30px">
            <h2>Option</h2>
            <a href="attendstudent?id=${requestScope.ID}">Course attendance</a> |
            <a href="grade?id=${requestScope.ID}">Grade</a> 
        </div>

         <hr style="margin-top: 30px; margin-bottom: 30px;">
        <div class="container">

            <form action="attendstudent" method="GET" id="formsubmit">
                <h3>List of subject: </h3>
                <input type="hidden" name="id" value="${requestScope.ID}">
                <select name="subID" onchange="document.getElementById('formsubmit').submit()">
                    <option value="choose">Choose subjects</option>
                    <c:forEach items="${requestScope.subject}" var="sub">
                        <option 
                            <c:if test="${sub.suID eq param.subID}">
                                selected="selected"
                            </c:if>
                            value="${sub.suID}">
                            ${sub.suName}
                        </option>
                        <c:if test="${sub.suID eq param.subID}">
                            <h3 style="color: darkorange">${sub.suName}</h3>
                        </c:if>
                    </c:forEach>
                </select>
            </form>
            <form action="attendstudent">
                <table border="1px solid black">
                    <c:if test="${requestScope.attendStudentAll.size()>=1}">
                        <tr style="background-color: darkorange" >
                            <td style="color: white">NO</td>
                            <td style="color: white">STATUS</td>
                            <td style="color: white">LECTURER</td>
                            <td style="color: white">GROUP</td>
                            <td style="color: white">TIME</td>
                            <td style="color: white">DATE</td>  
                        </tr>
                    </c:if>

                    <c:forEach items="${requestScope.attendStudentAll}" var="attAll" varStatus="status">

                        <tr>
                            <td>${status.index + 1}</td>
                            <td>
                                <c:forEach items="${requestScope.attendStudent}" var="att" >
                                    <c:if test="${att.isPresent && (attAll.lesson.leID eq att.lesson.leID)}">
                                        <p style="color: green"><b>Present</b></p>
                                    </c:if>
                                    <c:if test="${!att.isPresent && (attAll.lesson.leID eq att.lesson.leID) && (attAll.lesson.attended == true)}">
                                        <p style="color: red"><b>Absent</b></p>
                                    </c:if>
                                    <c:if test="${!att.isPresent &&  (attAll.lesson.attended == false)}">
                                        <p style="color: green">Future</p>
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>${attAll.lesson.lecturer.lID}</td>
                            <td>${attAll.lesson.group.gName}</td>
                            <td>${attAll.lesson.slot.tID}: ${attAll.lesson.slot.tDescript}</td>
                            <td>${attAll.lesson.date}</td>
                        </tr>

                    </c:forEach>


                </table>
            </form>
        </div>
        <div class="note">
            <h4>More note / Chú thích thêm:</h4>            
            <p>

                (<b style="color: green">Present</b>): You had attended this activity / Bạn đã tham gia hoạt động này<br>
                (<b style="color: red">Absent</b>): You have NOT attended this activity / Bạn chưa có mặt buổi này<br>

            </p>  
        </div>
        <div class="footer">
            <p style="text-align: center">Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ giáo viên: Email: <b>dichvugiaovien@fe.edu.vn</b>. Điện thoại: (024)7308.13.13</p>
        </div>
    </body>
</html>
