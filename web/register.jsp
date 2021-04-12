<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include file="navbar.jsp" %>

        <main class="d-flex align-items-center" style="height: 100vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <h4><span class="fa fa-user">  </span> Register</h4>
                            </div>

                            <div class="card-body">
                                <form id="reg-form" action="registerServlet" method="post">
                                    <div class="form-group">
                                        <label for="user_name">Name</label>
                                        <input type="text" name="user_name" required class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="user_email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="user_password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="gender">Gender</label><br>
                                        <input type="radio" id="gender" name="user_gender" value="Male">Male
                                        <input type="radio" id="gender" name="user_gender" value="Female">Female
                                    </div>

                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree <a href="">terms and conditions</a></label>
                                    </div>
                                    <div class="container text-center" id="loader" style="display:none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h4>Please wait</h4>
                                    </div><br>
                                    <div class="container text-center">
                                        <button id="submit-btn" type="submit" class="btn btn-outline-success">Submit</button>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </main>


        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $('#submit-btn').hide();
                    $('#loader').show();
                    $.ajax({
                        url: "registerServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $('#submit-btn').show();
                            $('#loader').hide();
                            if (data.trim() === 'done') {
                                swal("Registered Successfully!!").then((value) => {
                                    window.location = "login.jsp";
                                });
                            }
                            else{
                                swal("Already Registered!!").then((value) => {
                                    window.location = "login.jsp";
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR)
                            $('#submit-btn').show();
                            $('#loader').hide();
                            swal("Please provide all the details!!");
                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

    </body>
</html>
