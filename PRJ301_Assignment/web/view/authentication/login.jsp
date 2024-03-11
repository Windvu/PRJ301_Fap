<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <!--Made with love by Mutiullah Samim -->

        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="styles.css">

        <style>

            html,body{
                background-image: url('images/FPTU_Background.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                height: 100%;
                background-attachment: fixed;
                background-position: center;
                font-family: 'Numans', sans-serif;
                overflow: hidden;

            }

            .container{
                height: 100%;
                align-content: center;
            }

            .card{
                height: 370px;
                margin-top: 100px;
                margin-bottom: -500px;
                width: 400px;
                background-color: rgba(0,0,0,0.5) !important;
            }

            .card-header h3{
                color: white;
                text-align: center;
            }

            .input-group-prepend span{
                width: 50px;
                background-color: orange;
                color: black;
                border:0 !important;
            }

            input:focus{
                outline: 0 0 0 0  !important;
                box-shadow: 0 0 0 0 !important;

            }

            .remember{
                color: white;
            }

            .remember input
            {
                width: 20px;
                height: 20px;
                margin-left: 15px;
                margin-right: 5px;
            }

            .login_btn{
                color: black;
                background-color: orange;
                width: 100px;
            }

            .login_btn:hover{
                color: black;
                background-color: white;
            }
            
            h1{
                text-align: center;
                margin-top: 50px;
                font-weight: 500;
            }
         
        </style>
    </head>
    <body>
        <h1>WELCOME TO FPT UNIVERSITY</h1>
        <div class="container">
            <div class="d-flex justify-content-center h-100">
                <div class="card">
                    <div class="card-header">
                        <h3>Log In</h3>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="login">
                            <!-- USERNAME -->
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="username" name="username">
                            </div>
                            <!-- PASSWORD -->
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="password" name="password">
                            </div>
                            <!-- REMEMBER ME -->
                            <div class="row align-items-center remember">
                                <input type="checkbox">Remember Me
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Login" class="btn float-right login_btn">
                            </div>
                        </form>
                    </div>
                    <div class="card-footer">
                        <div style="color: red" class="d-flex justify-content-center">
                            ${requestScope.error}
                        </div>
                        <div class="d-flex justify-content-center">
                            <a href="#" style="color: white">Forgot your password?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>