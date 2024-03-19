<%-- 
    Document   : Timetable
    Created on : Feb 29, 2024, 7:21:31 PM
    Author     : Vu Minh Quan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timetable Of Lecturer</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;

            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            .container {
                display: flex; /* Sử dụng flexbox để căn chỉnh */
                justify-content: space-between; /* Căn đều các phần tử con */
                align-items: center; /* Căn giữa theo chiều dọc */
                padding: 10px; /* Thêm padding để tạo khoảng cách */
                border: 1px solid #ccc; /* Đặt đường viền cho khung */
                padding: 10px; /* Thêm padding để tạo khoảng cách giữa khung và nội dung */
                margin-bottom: 20px; /* Thêm margin để tạo khoảng cách giữa các khung */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */
            }
            .title {
                flex-grow: 1; /* Tiêu đề sẽ mở rộng để chiếm hết không gian còn lại */
                text-align: center; /* Căn giữa theo chiều ngang */
            }

            .footer {
                border: 1px solid #ccc; /* Đặt đường viền cho khung */
                padding: 10px; /* Thêm padding để tạo khoảng cách giữa khung và nội dung */
                margin-bottom: 20px; /* Thêm margin để tạo khoảng cách giữa các khung */
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */

            }
        </style>
        <script>
            function logout() {
                window.location.href = "../logout";
            }
        </script>
    </head>
    <body>



        <!-- ***title frame*** -->
        <div class="container">
            <a href="timetable?id=${requestScope.coreName}">
                <img src="../images/FPT_Education_logo.svg.png" alt="Logo_FPT" style="width:250px; height: 100px;">
            </a>            
            <h1 class="title">Lecturer's work schedule</h1>
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



        <!-- Note room  -->
        <div style="margin-left: 30px">
            <h3 style="">NOTE:</h3>
            <p>
                Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br>
                Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br>
                Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br>
                Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br>
                Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br>
                Little UK (LUK) thuộc tầng 5 tòa nhà Delta<br>
            </p>
        </div>



        <!-- Timetable -->
        <table border="1px">
            <!-- ***Line display the day***  -->
            <tr>
                <!-- Choose the days -->
                <td rowspan="2" style="background-color: darkorange">
                    <form action="timetable" method="GET">           
                        <input type="hidden" name="id" value="${param.id}"/>
                        <input type="date" value="${requestScope.from}" name="from"/><br>
                        <input value="${requestScope.to}" type="date" name="to"/> <br>
                        <input type="submit" value="Show"/>
                    </form>
                </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <!-- Weekdays -->
                    <td style="background-color: darkorange"  >
                        <div style="width: 100px ; color: white;  font-weight: bold">
                            ${d.dayName}
                        </div>
                    </td>
                    <!--column dividing the weeks -->
                    <c:if test="${d.dayName eq 'SATURDAY'}">
                        <td style="background-color: darkorange" ></td>
                    </c:if>
                </c:forEach><br>
            </tr>


            <tr>              
                <c:forEach items="${requestScope.dates}" var="d">
                    <!-- the days in week -->
                    <td style="background-color: darkorange">
                        <div style="width: 100px; color: white;  font-weight: bold">
                            ${d.day}
                        </div>
                    </td>
                    <!--column dividing the weeks -->
                    <c:if test="${d.dayName eq 'SATURDAY'}">
                        <td style="background-color: darkorange"></td>
                    </c:if>
                </c:forEach><br>
            </tr>

            
            <!-- Slots -->
            <c:set var="currentTime" value="<%= new java.util.Date() %>" />
            
            <!-- The position of lesson -->
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <!-- Slot column -->
                    <td style="background-color: darkorange; font-weight: bold;color: white ">${slot.tName}</td>
                    
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.lessons}" var="les">
                                <c:if test="${d.day eq les.date and les.slot.tID eq slot.tID}">
                                    <a href="attendence?id=${les.leID}" > 
                                        ${les.group.gName} <br>    
                                    </a>
                                    - ${les.group.subject.suID}<br>
                                    at ${les.room.rName}<br>
                                    <c:if test="${les.attended eq true}">
                                        (<b style="color: green">Attended</b>)
                                    </c:if>
                                    <c:if test="${(les.attended eq false) }">
                                        (<b style="color: red">Not yet</b>)<br>
                                        ${les.slot.tDescript}
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </td>
                        <!--column dividing the weeks -->
                        <c:if test="${d.dayName eq 'SATURDAY'}">
                            <td style="background-color: darkorange" ></td>
                        </c:if>
                    </c:forEach>
                </tr>  
            </c:forEach>
                
            <!-- The rows of timetable -->    
            <tr style="background-color: darkorange;">
                <td colspan="100%"></td>
            </tr>
        </table>



        <!-- ***Note attendance*** -->
        <div style="margin-left: 30px; margin-bottom: 30px">
            <h4>More note / Chú thích thêm:</h4>            
            <p>

                (<b style="color: green">attended</b>): You had attended this activity / Bạn đã tham gia hoạt động này<br>
                (<b style="color: red">Not yet</b>): You have NOT attended this activity / Bạn chưa có mặt buổi này<br>

            </p>  
        </div>



        <!-- ***Contact*** -->
        <div class="footer">
            <p style="text-align: center">Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ giáo viên: Email: <b>dichvugiaovien@fe.edu.vn</b>. Điện thoại: (024)7308.13.13</p>
        </div>
    </body>
</html>
