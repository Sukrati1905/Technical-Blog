<%@page import="dao.PostDao"%>
<%@page import="entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="entities.Message"%>
<%@page import="entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>

        <!--nav-bar-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-leaf"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Languages</a>
                            <a class="dropdown-item" href="#">Projects</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structures</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="my_posts.jsp">My Posts</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post">Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#user-profile"><span class="fa fa-user"></span>   <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logoutServlet"><span class="fa fa-power-off"></span>   Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--end of nav-bar-->

        <!--Message Display-->
        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%=m.getCssClass()%>" role="alert">
            <%=m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>

        <!--End of message display-->

        <!--main body of page-->

        <main>
            <div class="container-fluid">
                <div class="row mt-3">

                    <!--categories-->
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPost(0,this)"  class="c-link list-group-item list-group-item-action">
                                All Posts
                            </a>

                            <%
                                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = pd.getCategories();
                                for (Category ele : list) {
                            %>
                            <a href="#" onclick="getPost(<%= ele.getCid() %>,this)" class="c-link list-group-item list-group-item-action"><%= ele.getName()%></a>
                            <%
                                }

                            %>
                        </div>
                    </div>


                    <!--posts-->
                    <div class="col-md-8">

                        <div class="text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading</h3>
                        </div>
                        
                        <div id="post_container" class="container-fluid">
                            
                        </div>

                    </div>

                </div>

            </div>

        </main>

        <!--end of main body of page-->

        <!-- Profile Modal -->
        <div class="modal fade" id="user-profile" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title text-center" id="exampleModalLongTitle">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">
                            <img src="pictures/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 100px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLongTitle"><%=user.getName()%></h5>
                        </div>

                        <!--profile display-->

                        <div id="profile_details">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">About:</th>
                                        <td><%
                                            if (user.getAbout() != null) {
                                            %>
                                            <%= user.getAbout()%>
                                            <%
                                                }

                                            %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered on:</th>
                                        <td><%= user.getDateTime().toString()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <!--end of profile display-->
                        <!--profile edit form-->

                        <div id="profile_edit" style="display: none;">
                            <form action="updateServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tr>
                                        <th scope="row">ID:</th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Name:</th>
                                        <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"/></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Password:</th>
                                        <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"/></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:</th>
                                        <td><%= user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">About:</th>
                                        <td><textarea rows="5" class="form-control" name="user_about" ><%if (user.getAbout() != null) {%><%= user.getAbout()%>
                                                <%
                                                    }
                                                %>
                                            </textarea></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Profile Picture:</th>
                                        <td><input type="file" class="form-control" name="user_picture" multiple=false accept=image/* /></td>
                                    </tr>

                                    <tr>
                                        <th scope="row">Registered on:</th>
                                        <td><%= user.getDateTime().toString()%></td>
                                    </tr>
                                </table>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-success">Save changes</button>
                                </div>
                            </form>

                        </div>

                        <!--end of profile edit form-->
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end of profile modal-->

        <!--add-post modal-->

        <div class="modal fade" id="add-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header  primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="addPost_form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        Connection con = ConnectionProvider.getConnection();
                                        PostDao pdao = new PostDao(con);
                                        list = pdao.getCategories();
                                        for (Category elem : list) {
                                    %>
                                    <option value="<%= elem.getCid()%>"><%= elem.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" name="postTitle" placeholder="Title.."/>
                            </div>

                            <div class="form-group">
                                <textarea name="postContent" class="form-control" style="height: 200px;" placeholder="Content.."></textarea>
                            </div>

                            <div class="form-group">
                                <textarea name="postCode" class="form-control" style="height: 100px;" placeholder="Code(if any).."></textarea>
                            </div>

                            <div class="form-group">
                                <p style="color: darkgrey">Images(if any)..</p>
                                <input type="file" class="form-control" name="postImage" placeholder="Images(if any).."/>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control" name="postLink" placeholder="Link(if any).."/>
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-success" >POST</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!--end of add-post modal-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <!--script for profile-->

        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit').click(function () {
                    if (editStatus == false) {
                        $('#profile_details').hide();
                        $('#profile_edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $('#profile_details').show();
                        $('#profile_edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }
                })
            })
        </script>

        <!--end of script for profile-->

        <!--script for add post-->

        <script>

            $(document).ready(function (e) {

                $("#addPost_form").on("submit", function (event) {
                    console.log("Submitted");
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() == "done") {
                                swal("Good job!", "Your post has been uploaded!", "success").then((value) => {
                                    window.location = "profile.jsp";
                                });

                                console.log(data);
                            } else {
                                swal("Error!", "Something went wrong!", "error");
                            }
                            console.log(data);
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                        },
                        contentType: false,
                        processData: false
                    })
                })

            })
        </script>
        <!--end of script for add post-->

        <!--loading posts-->
        <script>
            function getPost(cid,temp){
                $("#loader").show();
                $("#post_container").hide();
                $(".c-link").removeClass("active list-group-item-success");
                
                
                $.ajax({
                    url : "load_posts.jsp",
                    data : {catid:cid,
                    userid:0,
                    delete : "no"},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $(temp).addClass("active list-group-item-success");
                        $("#loader").hide();
                        $("#post_container").show();
                        $("#post_container").html(data);
                    }
                })
            }
            
            $(document).ready(function(){
                let allPostRef=$(".c-link")[0]
                getPost(0,allPostRef);
                
                
            })
        </script>        
        <!--end of loading posts-->
        
        
    </body>
</html>
