<%-- 
    Document   : attendence
    Created on : Mar 2, 2024, 6:13:01 PM
    Author     : Vu Minh Quan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendence Of Lectuer</title>
        <style>
            td{
               text-align: center;
            }
        </style>
    </head>
    <body>
        <form action="attendence" method="POST">
            <input type="hidden" name="id" value="${param.id}"/>
            <table border="1px">
                <tr>
                    <td>NO</td>
                    <td>GROUP</td>
                    <td>CODE</td>
                    <td>NAME</td>
                    <td>IMAGE</td>
                    <td>STATUS</td>
                    <td>COMMENT</td>
                    <td>TAKER</td>
                    <td>RECORD TIME</td>
                </tr>
                <c:set var="count" value="1" scope="page"/><!-- Khởi tạo biến đếm -->
                <c:forEach items="${requestScope.atts}" var="a">

                    <tr>
                        <!-- NO -->
                        <td >
                             ${count}
                        </td>
                        <!-- GROUP -->
                        <c:forEach items="${requestScope.lessons}" var="less">
                            <c:if test="${param.id eq less.leID}">
                                <td>${less.group.gName}</td> <!-- Hiển thị tên nhóm -->

                            </c:if>
                        </c:forEach>

                        <!-- CODE -->
                        <td>${a.student.sID}</td>
                        <!-- NAME -->
                        <td>${a.student.sName}</td>
                        <!-- IMAGE -->   
                        <td>
                            <img src="../images/${a.student.sID}.jpg" width="140" height="160" alt="${a.student.sID}"/>
                        </td>
                        <!-- STATUS -->
                        <td>
                            <input 
                                ${!a.isPresent?"checked=\"checked\"":""}
                                type="radio" value="no" name="present${a.student.sID}" /> <p style="color:red">Absent</p>
                            <input type="radio"
                                   ${a.isPresent?"checked=\"checked\"":""}
                                   value="yes" name="present${a.student.sID}" style="color: green"/> <p style="color:green">Attendent</p>
                        </td>
                        <!--COMMENT-->
                        <td>
                            <input name="description${a.student.sID}" type="text" value="${a.aDescription}"/>
                        </td>
                        <!--TAKER-->
                        <c:forEach items="${requestScope.lessons}" var="less">
                            <c:if test="${param.id eq less.leID}">

                                <td>${less.lecturer.lID}</td> <!-- Hiển thị mã giáo viên -->
                            </c:if>
                        </c:forEach>
                        <!--RECORD TIME-->
                        <td>${a.aDate}</td>
                    </tr>  
                    <c:set var="count" value="${count + 1}" scope="page"/> <!-- Tăng biến đếm sau mỗi lần lặp -->
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
