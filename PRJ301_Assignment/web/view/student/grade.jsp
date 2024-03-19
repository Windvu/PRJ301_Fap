<%-- 
    Document   : Grade
    Created on : Mar 6, 2024, 8:56:52 PM
    Author     : Vu Minh Quan
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>The grade of student</title>
        <style>
            .container {
                display: flex;
                min-height: calc(80vh - 20px); /* Chiều cao tối thiểu của khối wrapper là 100% chiều cao của viewport trừ đi 20px */
                margin-bottom: -20px; /* Lề dưới âm để đảm bảo khối wrapper sẽ chạm vào đáy trình duyệt */

            }
            .subject {
                margin-right: 20px;
            }
            .hidden {
                display: none;
            }
            .subject {
                width: 100%; /* Bảng môn học chiếm toàn bộ chiều rộng */
                margin-right: 50px;
                margin-left: 50px;
            }

            .subject table {
                width: 100%; /* Bảng môn học chiếm toàn bộ chiều rộng */
                border-collapse: collapse; /* Gộp các viền của ô thành một viền */
            }

            .subject th, .subject td {
                border: 1px solid black; /* Định dạng border của ô */
            }

            th{
                text-align: left;
                color: white;
                background-color: darkorange;
            }

            th, td{
                padding: 10px;
            }
            .subject a {
                text-decoration: none; /* Loại bỏ gạch chân cho link */
                color: black; /* Màu chữ mặc định cho link */
            }

            .subject a:hover {
                font-weight: bold; /* Đặt độ đậm cho link khi hover */
            }

            .header_score td{
                color: white;
                background-color: darkorange;
            }
            .score table {
                margin-right: 50px;
                border-collapse: collapse; /* Gộp các viền của ô thành một viền */
            }
            .score td{
                text-align: center;
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
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); /* Thêm đổ bóng */
                margin-top: 100px
            }
        </style>
        <script>
            function showGrade(subjectID) {
                // Ẩn tất cả các bảng điểm
                var allGradeTables = document.getElementsByClassName('subjectGrade');
                for (var i = 0; i < allGradeTables.length; i++) {
                    allGradeTables[i].classList.add('hidden');
                }

                // Hiển thị bảng điểm của môn học được chọn
                var subjectGradeTable = document.getElementById(subjectID);
                subjectGradeTable.classList.remove('hidden');

                // Thêm tham số course vào URL
                var url = new URL(window.location.href);
                url.searchParams.set('course', subjectID);
                history.replaceState(null, null, url);
            }

            function logout() {
                window.location.href = "../logout";
            }
        </script>
    </head>
    <body>
        <div class="container_header">
            <a href="home?id=${requestScope.ID}">
                <img src="../images/FPT_Education_logo.svg.png" alt="Logo_FPT" style="width:250px; height: 100px;">
            </a> 
            <h1 class="title">Student' score</h1>
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

        <div style="margin-left: 50px; margin-bottom: 30px">
            <h2>Option</h2>
            <a href="attendstudent?id=${requestScope.ID}">Course attendance</a> |
            <a href="grade?id=${requestScope.ID}">Grade</a> 
        </div>
        
        <div class="container">

            <!-- Subject -->
            <div class="subject">
                <table border="1px solid black">
                    <tr>
                        <th>COURSE</th>
                    </tr>
                    <c:forEach items="${requestScope.subject}" var="sub">
                        <tr>
                            <td>
                                <a href="#" onclick="showGrade('${sub.suID}')">${sub.suName} (${sub.suID})</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <!--Score-->
            <div class="score">
                <c:forEach items="${requestScope.subject}" var="sub">
                    <table id="${sub.suID}" class="subjectGrade hidden" border="1px">

                        <tr class="header_score">
                            <td>GRADE CATEGORY</td>
                            <td>GRADE ITEM</td>

                            <c:if test="${!sub.suID.endsWith('c')}">
                                <td>WEIGHT</td> 
                            </c:if>

                            <td>VALUE</td>
                            <td>COMMENT</td>
                        </tr>

                        <c:forEach items="${requestScope.grade}" var="score">
                            <c:if test="${score.subject.suID eq sub.suID}">
                                <tr>
                                    <td>${score.category}</td>
                                    <td>${score.assName}</td>      

                                    <c:if test="${!score.subject.suID.endsWith('c')}">
                                        <td><fmt:formatNumber value="${score.weight * 100}" pattern="0'%'" /></td>
                                    </c:if>     

                                    <c:if test="${score.grade.score > -1}">
                                        <td>  ${score.grade.score}</td>
                                    </c:if>
                                    <c:if test="${score.grade.score <= -1}">
                                        <td></td>
                                    </c:if>
                                    <td>${score.grade.comment}</td>
                                </tr>                               
                            </c:if>
                        </c:forEach>

                        <c:set var="totalScore" value="0" />
                        <c:forEach items="${requestScope.grade}" var="score">
                            <c:if test="${score.subject.suID eq sub.suID}">
                                <c:if test="${score.grade.score > -1}">
                                    <c:set var="totalScore" value="${totalScore + score.grade.score*score.weight}" />
                                </c:if>
                            </c:if>
                        </c:forEach>

                        <%-- Chuyển totalScore thành JavaScript string và làm tròn số sau dấu thập phân --%>
                        <script>
                            var totalScoreValue = <c:out value="${totalScore}" />;
                            var roundedTotalScore = parseFloat(totalScoreValue).toFixed(1);
                        </script>
                        <%-- check status --%>
                        <c:set var="studyingFlag" value="false" />
                        <c:forEach items="${requestScope.grade}" var="score">
                            <c:if test="${score.subject.suID eq sub.suID and score.grade.score == -1}">
                                <c:set var="studyingFlag" value="true" />
                            </c:if>
                        </c:forEach>
                        <tr>
                            <td rowspan="2">Course total</td>
                            <td >Average</td>
                            <td colspan="3">
                                <%-- Hiển thị giá trị đã được làm tròn --%>  
                                <c:if test="${studyingFlag==false}">
                                    <script>document.write(roundedTotalScore);</script>
                                </c:if>

                            </td>    
                        </tr>
                        <tr>
                            <td >Status</td>
                            <td colspan="3">  
                                <c:if test="${studyingFlag}">
                                    <font color="green">Studying</font>
                                </c:if>

                                <c:if test="${studyingFlag == false}">
                                    <c:if test="${totalScore >= 5}">
                                        <font color="Green">Passed</font>
                                    </c:if>
                                    <c:if test="${totalScore < 5}">
                                        <font color="Red">Not passed</font>
                                    </c:if>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>
        <div class="footer">
            <p style="text-align: center">Mọi góp ý, thắc mắc xin liên hệ: Phòng dịch vụ sinh viên: Email: <b>dichvusinhvien@fe.edu.vn</b>. Điện thoại: (024)7308.13.13</p>
        </div>
    </body>
</html>

