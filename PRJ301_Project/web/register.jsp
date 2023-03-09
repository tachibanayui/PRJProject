<%-- 
    Document   : register
    Created on : Mar 5, 2023, 11:22:30 PM
    Author     : Viet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: sans-serif;
            }
            html,body{
                display: grid;
                height: 100%;
                place-items: center;
                background: #f2f2f2;
            }
            .wrapper{
                max-width: 390px;
                background: #fff;
                padding: 30px;
                border-radius: 5px;
                box-shadow: 0px 15px 20px rgba(0,0,0,0.1);
            }
            .wrapper .title-text{
                display: flex;
                width: 200%;
            }
            .wrapper .title-text .title{
                width: 50%;
                font-size: 35px;
                font-weight: 600;
                text-align: center;
            }
            .wrapper .form-container{
                width: 100%;
            }
            
            .form-container .form-inner form .field{
                height: 50px;
                width: 300px;
                margin-top: 20px;
            }
            .form-inner form .field input{
                height: 100%;
                width: 100%;
                outline: none;
                padding-left: 15px;
                font-size: 17px;
                border-radius: 5px;
                border: 1px solid lightgray;
                border-bottom-width: 2px;
                transition: all 0.4s ease;
            }
            .form-inner form .field input:focus{
                border-color: #fc83bb;
            }
            .form-inner form .error {
                
                margin-top: 5px;
            }
            .form-inner form .signup-link a{
                color: #fa4299;
                text-decoration: none;
            }
            .form-inner form .signup-link{
                text-align: center;
                margin-top: 30px;
            }
            .form-inner form .signup-link a:hover{
                text-decoration: underline;
            }
            form .field input[type="submit"]{
                font-size: 20px;
                font-weight: 500;
                padding-left: 0px;
                border: none;
                cursor: pointer;
                background: -webkit-linear-gradient(left, #a445b2, #fa4299);
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <div class="title-text">
                <div class ="title login">Register</div>
            </div>
            <div class="form-container">
            <div class="form-inner">
                <form acion="login" class="login" method="post">
                    <div class="field">
                        <input type="text" placeholder="Username" name="username" required="true">
                    </div>
                    <div class="field">
                        <input type="password" placeholder="Password" name="password" required="true">
                    </div>
                    <div class="field">
                        <input type="password" placeholder="Confirm Password" name="Conpass" required="true">
                    </div>
                    <div class="error">${status}</div>
                    <div class="field">
                        <input type="submit" value="Sign Up">
                    </div>
                </form>
            </div>
    </body>
</html>
