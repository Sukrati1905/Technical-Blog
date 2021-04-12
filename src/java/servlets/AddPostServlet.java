package servlets;

import dao.PostDao;
import entities.*;
import helper.ConnectionProvider;
import helper.ProfilePicture;
import java.io.*;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;



@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession s=request.getSession();
            User user=(User)s.getAttribute("currentUser");
            int userId=user.getId();
            int cId=Integer.parseInt(request.getParameter("cid"));
            String title=request.getParameter("postTitle");
            String content=request.getParameter("postContent");
            String code=request.getParameter("postCode");
            Part part=request.getPart("postImage");
            String image=part.getSubmittedFileName();
            String link=request.getParameter("postLink");
            
            if(image=="")
                image="default.png";
            
            Post post=new Post(title, content, code, image, link, cId, userId);
            PostDao pd=new PostDao(ConnectionProvider.getConnection());
            
            boolean status=pd.savePost(post);
            if(status){
                String newFilePath = request.getRealPath("/") + "blog_pictures" + File.separator + image;
                if(!image.equals("default.png"))
                    ProfilePicture.saveFile((FileInputStream) part.getInputStream(), newFilePath);
                    
                
                out.println("done");
            }
            else
                out.println("error");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
