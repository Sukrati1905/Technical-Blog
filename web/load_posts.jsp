<%@page import="dao.LikeDao"%>
<%@page import="dao.UserDao"%>
<%@page import="entities.User"%>
<%@page import="entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="helper.ConnectionProvider"%>
<%@page import="dao.PostDao"%>

<div class="row">
    <%
        PostDao pd = new PostDao(ConnectionProvider.getConnection());
        List<Post> p = null;
        int cid = Integer.parseInt(request.getParameter("catid"));
        int uid= Integer.parseInt(request.getParameter("userid"));
        String delete=request.getParameter("delete");
        if(uid==0){
            if (cid == 0) {
                p = pd.getAllPosts();
            } else {
                p = pd.getPostsByCategoryID(cid);
            }
        }
        else{
            p = pd.getPostByUserId(uid, cid);
        }

        if (p.size() == 0) {
    %>
        <h5 class="display-3 text-center mt-3" style="color: darkgray;">No posts in this category</h5>
    <%
        }

        for (Post post : p) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">

            <img class="card-img-top" src="blog_pictures/<%= post.getpImage()%>" alt="Error loading blog image">
            <div class="card-body">
                <h5 class="card-title"><%= post.getpTitle()%></h5>
                <p><%= post.getpContent().substring(0, 2) %>....</p>
       
            </div>
            <%
                User user = (User) session.getAttribute("currentUser");
            %>
            <div class="card-footer ">
                <%
                    LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                %>
                <button href="" class="btn btn-outline-success btn-sm"><span class="like-counter">Likes <%= ld.countLikes(post.getpID())%></span></button>
                <a href="show_blog.jsp?post-id=<%= post.getpID()%>&deletion= '<%= delete.toString() %>'" class="btn btn-outline-success btn-sm">Read more..</a>
            </div>

        </div>

    </div>

    <%
        }

    %>



</div>
