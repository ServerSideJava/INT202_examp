package int202.mid.exam.mid_exam_041.servlet;

import int202.mid.exam.mid_exam_041.model.AllUser;
import int202.mid.exam.mid_exam_041.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
// 65130500041
@WebServlet(name = "RegisterServlet", value = "/041/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");

        User user = new User(username, email);

        AllUser.addUser(user);

        request.getSession().setAttribute("user" ,user);

        getServletContext().getRequestDispatcher("/register.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
 