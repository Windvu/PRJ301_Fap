<%-- 
    Document   : login
    Created on : Feb 21, 2024, 8:09:41 AM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            .login-container{
                margin-top: 8%;
                margin-bottom: 5%;
            }
            .login-logo{
                position: relative;
                margin-left: -50.5%;
            }
            .login-logo img{
                position: absolute;
                width: 30%;
                margin-top: 15%;
                background: #282726;
                border-radius: 4.5rem;
                padding: 5%;
            }
            .login-form-1{
                padding: 9%;
                background:#282726;
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-1 h3{
                text-align: center;
                margin-bottom:12%;
                color:#fff;
            }
            .login-form-2{
                padding: 9%;
                background: #f05837;
                box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
            }
            .login-form-2 h3{
                text-align: center;
                margin-bottom:12%;
                color: #fff;
            }
            .btnSubmit{
                font-weight: 600;
                width: 50%;
                color: #282726;
                background-color: #fff;
                border: none;
                border-radius: 1.5rem;
                padding:2%;
            }
            .btnForgetPwd{
                color: #fff;
                font-weight: 600;
                text-decoration: none;
            }
            .btnForgetPwd:hover{
                text-decoration:none;
                color:#fff;
            }

        </style>
    </head>
    <body>


        <div class="container login-container" >
            <div class="row">

                <div class="col-md-6 login-form-1">
                    <h3>Lecturer</h3>
                    <form action="login" method="POST" >
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username *" name="username" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Your Password *" name="password" />
                        </div>
                        <div style="color: red">
                            ${requestScope.errorLecturer}
                        </div><br>
                        <div class="form-group">                       
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                    </form>
                    <div class="form-group">
                        <a href="#" class="btnForgetPwd">Forget Password?</a>
                    </div>

                </div>

                        
                <div class="col-md-6 login-form-2">
                    <div class="login-logo">
                        <img src="images/logo_FPT.jpg" alt="FPT_logo"/>
                    </div>
                    <h3>Student</h3>
                    <form action="login" method="POST" >
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username *" name="usernameStudent" />
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Your Password *" name="passwordStudent" />
                        </div>
                        <div style="color: black">
                            ${requestScope.errorStudent}
                        </div><br>
                        <div class="form-group">
                            <input type="submit" class="btnSubmit" value="Login" />
                        </div>
                    </form>
                    <div class="form-group">

                        <a href="#" class="btnForgetPwd" value="Login">Forget Password?</a>
                    </div>                  
                </div>

            </div>
        </div>



    </body>
</html>
