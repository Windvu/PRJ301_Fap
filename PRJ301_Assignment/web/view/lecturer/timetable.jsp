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
        </style>
    </head>
    <body>

        <table border="1px">
            <tr>
                <td rowspan="2" style="background-color: darkorange">
                    <form action="timetable" method="GET">           
                        <input type="date" value="${requestScope.from}" name="from"/>  <br>
                        <input value="${requestScope.to}" type="date" name="to"/> <br>
                        <input type="submit" value="Show"/>
                    </form>
                </td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td style="background-color: darkorange"  >
                        <div style="width: 100px ; color: white;  font-weight: bold">
                            ${d.dayName}
                        </div>
                    </td>
                    <c:if test="${d.dayName eq 'SATURDAY'}">
                        <td style="background-color: darkorange"></td>

                    </c:if>
                </c:forEach><br>
            </tr>
            <tr>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td style="background-color: darkorange">
                        <div style="width: 100px; color: white;  font-weight: bold">
                            ${d.day}
                        </div>
                    </td>
                    <c:if test="${d.dayName eq 'SATURDAY'}">
                        <td style="background-color: darkorange"></td>
                    </c:if>
                </c:forEach><br>
            </tr>
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
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
                                        (Attendence)
                                    </c:if>
                                    <c:if test="${les.attended eq false}">
                                        (Not yet)<br>
                                        ${les.slot.tDescript}
                                    </c:if>

                                </c:if>
                            </c:forEach>
                        </td>
                        <c:if test="${d.dayName eq 'SATURDAY'}">
                            <td style="background-color: darkorange"></td>
                        </c:if>
                    </c:forEach>
                </tr>  
            </c:forEach>
            <tr style="background-color: darkorange;">
                <td colspan="100%"></td> <!-- Số cột này phải lớn hơn hoặc bằng số cột trong bảng -->
            </tr>
        </table>





    </body>
</html>
