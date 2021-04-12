package servlets;

import dao.UserDao;
import entities.Message;
import entities.User;
import helper.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig
public class updateServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            System.out.println("*******************************************************************");
            String name = request.getParameter("user_name");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about").trim();
            Part part = request.getPart("user_picture");
            System.out.println("part=" + part.getInputStream());
            String imageName = part.getSubmittedFileName().trim();

            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            System.out.println("id="+user.getName());

            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);

            String oldPicture = user.getProfile();
            if(!imageName.isEmpty())
                user.setProfile(imageName);
            boolean status = dao.updateInformation(user);
            
            if (status && !imageName.isEmpty()) {
                String newFilePath = request.getRealPath("/") + "pictures" + File.separator + user.getProfile();
                System.out.println("path=" + newFilePath);
                String oldFilePath = request.getRealPath("/") + "pictures" + File.separator + oldPicture;
                System.out.println("old path=" + oldFilePath);

                if (!oldPicture.equals("default.png")) {
                    boolean flag=ProfilePicture.deletePicture(oldFilePath);
                    System.out.println("flag="+flag);
                }

                if (ProfilePicture.saveFile((FileInputStream) part.getInputStream(), newFilePath)) {
                    Message msg = new Message("Profile updated", "success", "alert-success");
                    s.setAttribute("msg", msg);

                } else {
                    Message msg = new Message("Profile picture not updated!", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

            }
            
            else if(status){
                Message msg = new Message("Profile updated", "success", "alert-success");
                s.setAttribute("msg", msg);
            }
            
            else{
                Message msg = new Message("Something went wrong!", "error", "alert-danger");
                s.setAttribute("msg", msg);
            }
            System.out.println("******************************************************************************************");
            response.sendRedirect("profile.jsp");
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
