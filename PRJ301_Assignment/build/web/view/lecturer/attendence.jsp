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
    </head>
    <body>
        <form action="attendence" method="POST">
            <input type="hidden" name="id" value="${param.id}"/>
            <table border="1px">
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Presented</td>
                    <td>Description</td>
                    <td>Time</td>
                </tr>
                
                <c:forEach items="${requestScope.atts}" var="a">
                    <input type="hidden" name="">
                    <tr>
                        <td>${a.student.sID}</td>
                        <td>${a.student.sName}</td>
                        <td>
                            <input 
                                ${!a.isPresent?"checked=\"checked\"":""}
                                type="radio" value="no" name="present${a.student.sID}"/> No
                            <input type="radio"
                                   ${a.isPresent?"checked=\"checked\"":""}
                                   value="yes" name="present${a.student.sID}" /> Yes
                        </td>
                        <td>
                            <input name="description${a.student.sID}" type="text" value="${a.aDescription}"/>
                        </td>
                        <td>${a.aDate}</td>
                    </tr>   
                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
