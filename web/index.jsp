
<%@page import="helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <%@include file="navbar.jsp" %>
        <div class="container-fluid p-0 m-0">

            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog</h3>
                    <h2 class="display-6">Read.Learn.Write.Share...</h2><br><br>
                    <p><b>What is Technical Blogging?</b></p>
                    <p>Well, the best way to learn something is to teach others the knowledge that you have gained. Regurgitating that information will solidify it more firmly in your mind. Technical blogging is a great way to share your expertise while building a potentially valuable readership. It can help you to document projects, or provide guidance to other web users. You can also monetize your content, or use your blog to market your services.</p>

                    <a href="register.jsp" class="btn btn-outline-light btn-lg">Get Started</a>
                    <a href="login.jsp" class="btn btn-outline-light btn-lg">Login</a>
                </div>
            </div>

        </div>

        <div class="container">
            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as....</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as....</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as....</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

            </div>


            <div class="row mb-2">
                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as....</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as....</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Java is a class-based, object-oriented programming language that is designed to have as few implementation dependencies as....</p>
                            <a href="#" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js" type="text/javascript"></script>
    </body>
</html>
